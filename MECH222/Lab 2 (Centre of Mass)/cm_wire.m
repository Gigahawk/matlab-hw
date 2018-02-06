function [x_cm,y_cm,z_cm,m_tot] = cm_wire(x,y,z,rho,print)
% Compute the centre of mass [x_cm,y_cm,z_cm] and
% the total mass m_tot of the wire
% with coordinates given by x, y, and z, and density rho.

x_0 = x(1:end-1);
x_1 = x(2:end);
y_0 = y(1:end-1);
y_1 = y(2:end);
z_0 = z(1:end-1);
z_1 = z(2:end);
rho_0 = rho(1:end-1);
rho_1 = rho(2:end);
r_0 = [x_0 y_0 z_0];
r_1 = [x_1 y_1 z_1];

L = sqrt((x_1-x_0).^2+(y_1-y_0).^2+(z_1-z_0).^2);
m = L.*(rho_0+rho_1)./2;

r_icm = r_0 + (1/3)*((rho_0+2*rho_1)./(rho_0+rho_1)).*(r_1-r_0);

% don't use plot in cm_points because it will graph as a 
% point cloud
[x_cm,y_cm,z_cm,m_tot] = cm_points(r_icm(:,1),r_icm(:,2),r_icm(:,3),m,'n');

if print == 'y'
	plot3(x,y,z);
	hold on;
	axis equal;
	grid on;
	plot3(x_cm,y_cm,z_cm,'r.','MarkerSize',75);
	hold off;
end

end

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

end
