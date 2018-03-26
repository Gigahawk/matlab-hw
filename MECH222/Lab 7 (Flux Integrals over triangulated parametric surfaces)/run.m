[T,X,Y,Z] = triangulate(@paraboloid,[0,1],[0,2*pi],[5,10]);
total_flux = flux_integral(T,X,Y,Z,@(x,y,z) [x,y,z]);

function p = paraboloid(r,theta)
	x = r.*cos(theta);
	y = r.*sin(theta);
	z = 1 - r.^2;
	p = [x,y,z];
end
