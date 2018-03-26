function [T,X,Y,Z] = triangulate(r,u,v,N)
% Compute a triangulation of a parametric surface r(u,v) = (x,y,z)
% 
% INPUT:
%   r : vector function r(u,v) = (x,y,z) defining a parametric surface
%   u : vector of length 2 defining bounds on parameter u(1) <= u <= u(2)
%   v : vector of length 2 defining bounds on parameter v(1) <= v <= v(2)
%   N : vector of length 2 defining number of points in u-v grid, N(1) points
%       in u direction and N(2) points in v direction
%
% OUTPUT:
%   X,Y,Z : vectors defining the coordinates of vertices in the triangulation
%   T : matrix defining the vertices of each triangle in triangulation.
%       In particular, the Nth row is a vector of indices T(N,:) = [i,j,k]
%       that specifies the vertices (X(i),Y(i),Z(i)), (X(j),Y(j),Z(j)) and
%       (X(k),Y(k),Z(k)) for the Nth triangle of the triangulation
%
% See also: delaunay
% 
% Patrick Walls, 2018-03-04

% Create a grid of points in the uv-plane
us = linspace(u(1),u(2),N(1));
vs = linspace(v(1),v(2),N(2));
[Us,Vs] = meshgrid(us,vs);

% Flatten the matrices U,V into column vectors
U = reshape(Us,[N(1)*N(2),1]);
V = reshape(Vs,[N(1)*N(2),1]);

% Compute X,Y,Z coordinates using the parameterization r(u,v) = (x,y,z)
vals = r(U,V);
X = vals(:,1);
Y = vals(:,2);
Z = vals(:,3);

% Compute the matrix of vertex indices of the triangulation
T = delaunay(U,V);

end
