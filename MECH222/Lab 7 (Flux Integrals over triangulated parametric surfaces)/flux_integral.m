function total_flux = flux_integral(T,X,Y,Z,F)

trimesh(T,X,Y,Z);
hold on;

V = [X Y Z];

a = T(:,1);
b = T(:,2);
c = T(:,3);

A = V(a,:);
B = V(b,:);
C = V(c,:);

P = (A + B + C)/3;
AB = B - A;
AC = C - A;

n = cross(AB,AC,2);

x = P(:,1);
y = P(:,2);
z = P(:,3);

f = F(x,y,z);

un = n(:,1);
vn = n(:,2);
wn = n(:,3);
uF = f(:,1);
vF = f(:,2);
wF = f(:,3);

quiver3(x,y,z,un,vn,wn);
quiver3(x,y,z,uF,vF,wF);

total_flux = sum(dot(n,f,2))

