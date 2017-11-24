function slope_field_euler(f,tspan,yspan,grid_step,y0,time_step)
% Plot the slope field of the first order differetnial equation y' = f(t,y)
% and plot an approximate solution using Euler's method

t = [tspan(1):grid_step:tspan(2)];
y = [yspan(1):grid_step:yspan(2)];

% Length of line
L = grid_step;

for i = t(1,:)
    for j = y(1,:)
        slope = f(i,j);
        dt = (L/2)*cos(atan(slope));
        dy = (L/2)*sin(atan(slope));
        plot([i-dt,i+dt],[j-dy,j+dy],'b')
        hold on
    end
end

T = [tspan(1):time_step:tspan(2)];
Y = [y0];

for k = T(1,:)
    if k == T(1,end)
        break
    end
    m_y = Y(end);
    slope = f(k,m_y);
    dy = time_step*slope;
    Y = [Y, m_y+dy];
end

plot(T,Y,'r.-',...
    'MarkerSize',20)

xlim(tspan)
xlabel('t')

ylim(yspan)
ylabel('y')

title(['Slope Field for y'' = ', func2str(f)]) 

hold off


