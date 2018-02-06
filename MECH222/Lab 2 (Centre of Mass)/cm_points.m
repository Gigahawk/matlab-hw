function [x_cm,y_cm,z_cm,m_tot] = cm_points(x,y,z,m,print)
% Compute the centre of mass [x_cm,y_m,z_cm] and
% the total mass m_tot of the point cloud
% with coordinates given by x, y, and z, and mass m.

m_tot = sum(m);
x_cm = sum(x.*m)/m_tot;
y_cm = sum(y.*m)/m_tot;
z_cm = sum(z.*m)/m_tot;

if print == 'y'
	% plot the point cloud
	plot3(x,y,z,'b.');
	hold on;
	axis equal;
	grid on;
	plot3(x_cm,y_cm,z_cm,'r.','MarkerSize',50);
	hold off;
end
