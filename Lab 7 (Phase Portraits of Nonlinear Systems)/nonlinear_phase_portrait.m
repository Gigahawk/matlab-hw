function nonlinear_phase_portrait(f1, f2, x1_range, x2_range, step)
% Plot the phase portrait of the nonlinear system dxdt = [f1(x); f2(x)]
x1_quiver = x1_range(1):step:x1_range(2);
x2_quiver = x2_range(1):step:x2_range(2);

[x1,x2] = meshgrid(x1_quiver,x2_quiver);
U = f1(x1,x2);
V = f2(x1,x2);

[m,n] = size(U);

for i = 1:m
    for j = 1:n
        u = U(i,j);
        v = V(i,j);
        
        s = sqrt(u^2 + v^2);
        
        u = u/s * 0.6*step;
        v = v/s * 0.6*step;
        U(i,j) = u;
        V(i,j) = v;
    end
end

hold off;
quiver(x1,x2,U,V,0,'Color',[0 113/255 188/255]);
hold on;

xlim(x1_range);
ylim(x2_range);

fimplicit(f1,[x1_range x2_range],'r--')
fimplicit(f2,[x1_range x2_range],'r--')

ssPrompt = 'Find a steady state? (y/n) ';
trajPrompt = 'Plot a trajectory? (y/n) ';
initPrompt = 'Enter initial condition [x1,x2]: ';

solvefun = @(x) [f1(x(1),x(2));f2(x(1),x(2))];
options = optimoptions('fsolve', 'Display', 'none');
while input(ssPrompt,'s') == 'y'
    init = input(initPrompt);
    solution = fsolve(solvefun,init,options);
    plot(solution(1),solution(2),'bo','MarkerFaceColor','b','MarkerSize',8);
end

odefun = @(t,x) [f1(x(1),x(2));f2(x(1),x(2))];
options = odeset('Events', @stop);
while input(trajPrompt,'s') == 'y'
    init = input(initPrompt);
    [~,U] = ode45(odefun,[0,-Inf],init,options);
    plot(U(:,1),U(:,2),'b')
    [~,U] = ode45(odefun,[0,Inf],init,options);
    plot(U(:,1),U(:,2),'b')
end

function [value,isterminal,direction] = stop(t,y)
    value = [1,1];
    x_mid = mean(x1_range);
    y_mid = mean(x2_range);
    position = y - [x_mid; y_mid];
    if norm(position) > norm([diff(x1_range),diff(x2_range)])/2
        value(1) = 0;
    end
    if norm(odefun(t,y)) < 1e-4
        value(2) = 0;
    end
    isterminal = [1,1];
    direction = [0,0];
end
end

