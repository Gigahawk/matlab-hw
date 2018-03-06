% Area should be 95.9996 assuming I didn't screw it up

[T,X,Y,Z] = triangulate(@conch,[0,1],[0,pi],[80,40]);

tri_surface_area(T,X,Y,Z)

function p = conch(u,v)
	x = 2*(1-exp(u)).*sin(6*pi*u).*cos(v).^2;
	y = 2.*(1-exp(u)).*cos(6*pi*u).*cos(v).^2;
	z = 1 - exp(2*u) - sin(2*v) + exp(u).*sin(2*v);
	p = [x,y,z];
end


