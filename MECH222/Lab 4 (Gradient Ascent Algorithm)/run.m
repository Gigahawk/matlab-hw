clear
f = @(x,y) (2*y - y.^2) .* sin(x);
[x,y,z,t,n] = gradient_ascent(f,[0,pi,0,2],[0.1,0.1],0.01,0.2,0.001,1000)
