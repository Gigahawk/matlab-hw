function area = tri_surface_area(T,X,Y,Z)
trimesh(T,X,Y,Z);

V = [X Y Z];

% Get a column matrix of the vertex indicies for each triangle
a = T(:,1);
b = T(:,2);
c = T(:,3);

% Get a column of row vectors for each triangle vertex
A = V(a,:);
B = V(b,:);
C = V(c,:);

% Get a column of row vectors for the two tringale sides
AB = B - A;
AC = C - A;

% Find the cross product of the triangle sides (Passing 2
% tells cross to use row vectors instead of column vectors)
crs = cross(AB,AC,2);

% Find the area of each triangle and sum them up
areas = 1/2 * sqrt(sum(crs.^2,2));
area = sum(areas);


% Idk if you wanted it done with a loop but you can also do
% it that way
% [rows,~] = size(T);
%
% area = 0;
% for i = 1:rows
% 	ab = V(T(i,2),:)- V(T(i,1),:);
% 	ac = V(T(i,3),:) - V(T(i,1),:);
% 	crs = cross(ab,ac);
% 	area = area + 1/2 * sum(sqrt(sum(crs.^2,2)));
% end

end

