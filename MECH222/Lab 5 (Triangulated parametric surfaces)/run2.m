% Simpler test script using a flat plane
% Area should be equal to sqrt(2) = 1.4142
[T,X,Y,Z] = triangulate(@flat_plane,[0,1],[0,1],[10,10]);

A = tri_surface_area(T,X,Y,Z)

function p = flat_plane(u,v)
	x = u;
	y = v;
	z = u;
	p = [x,y,z];
end


