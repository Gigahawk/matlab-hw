function A = ellipsoid_area(a,b,c)

N = 30;
theta = linspace(0,2.*pi,N);
phi = linspace(0,pi,N);
[THETA,PHI] = meshgrid(theta,phi);
X = sin(PHI) .* cos(THETA) .* a;
Y = sin(PHI) .* sin(THETA) .* b;
Z = cos(PHI) .* c;

surf(X,Y,Z);
axis equal

fun = @(x,y) sqrt((1-(1-c.^2./a.^2).*(x.^2./a.^2)-(1-c.^2./b.^2).*(y.^2./b.^2))./(1-x.^2./a.^2-y.^2./b.^2));
ymax = @(x) b.*sqrt(1-x.^2./a.^2);
A = 8*integral2(fun,0,a,0,ymax);

end
