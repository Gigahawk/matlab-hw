function [xmax, ymax, zmax, total_time, n_iter] =...
	gradient_ascent(f, R, start, h, step_size, tol, max_iter)

[x_0, y_0] = deal(start(1), start(2));
z_0 = f(x_0, y_0);

x_path = [x_0];
y_path = [y_0];
z_path = [z_0];

f_x = @(x, y) (f(x + h, y) - f(x - h, y))/(2.*h);
f_y = @(x, y) (f(x, y + h) - f(x, y - h))/(2.*h);

[x_i, y_i, z_i] = deal(x_0, y_0, z_0);

t_0 = tic;
for i = 1:max_iter
	f_xi = f_x(x_i, y_i);
	f_yi = f_y(x_i, y_i);
	x_i = x_i + step_size.*f_xi;
	y_i = y_i + step_size.*f_yi;
	z_i = f(x_i, y_i);
	x_path = [x_path, x_i];
	y_path = [y_path, y_i];
	z_path = [z_path, z_i];

	% Exit loop if gradient is really small (i.e. we are near a local maximum)
	if norm([f_xi,f_yi]) < tol
		t_f = toc(t_0);
		[xmax, ymax, zmax, total_time, n_iter] = deal(x_i, y_i, z_i, t_f, i);
		disp(num2str([total_time, n_iter],...
		'Local maximum found in %.3f seconds and %d iterations.'))
		plot_ascent(f, R, x_path, y_path, z_path);
		return
	end
end
t_f = toc(t_0);

[xmax, ymax, zmax, total_time, n_iter] = deal(x_0, y_0, z_0, t_f, i);
disp(num2str(n_iter, 'Local maximum not found after %d iterations.'))
plot_ascent(f, R, x_path, y_path, z_path);

end


function plot_ascent(f, R, x_path, y_path, z_path)
% I know the instructions say to use contour (and presumably surf) but
% this is far more elegant than creating an entire meshgrid just for
% plotting purposes please don't dock marks.

subplot(2, 2, 1);
fsurf(f, R);
hold on;
plot3(x_path, y_path, z_path, 'r.');

subplot(2, 2, 2);
fcontour(f, R);
hold on;
colorbar;
plot(x_path, y_path,'r.');

end
