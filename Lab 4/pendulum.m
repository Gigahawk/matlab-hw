function M = pendulum(L, tspan, y0, fps)
% Animate the motion of a simple pendulum in two ways:
% 1. Use ode45 to solve the the nonlinear equation: y'' + (g/L)sin(y) = 0
% 2. Use the small angle approximation: y'' + (g/L)y = 0
tspan=linspace(tspan(1),tspan(2),fps*(tspan(2)-tspan(1)));
g = 9.81;%m/s^2
    function dpdt = pend(t,p)
        dpdt = zeros(2,1);
        dpdt(1) = p(2);
        dpdt(2) = -g/L*sin(p(1));% smth smth scopes and stuff
    end

    function dpdt_approx = pend_approx(t,p)
        dpdt_approx = zeros(2,1);
        dpdt_approx(1) = p(2);
        dpdt_approx(2) = -g/L*p(1);
    end

[t_true,p_true] = ode45(@pend,tspan,y0);
[t_approx,p_approx] = ode45(@pend_approx,tspan,y0);
t_true = t_true';
p1_true = p_true(:,1)';
p1_approx = p_approx(:,1)';

X = @(theta) L*sin(theta);
Y = @(theta) -L*cos(theta);

for i = 1:length(t_true)
    xlim([-2,2]); ylim([-2,2]);
    xTrue = X(p1_true(i));
    yTrue = Y(p1_true(i));
    xApprox = X(p1_approx(i));
    yApprox = Y(p1_approx(i));
    
    xTrueRod = [0,xTrue];
    yTrueRod = [0,yTrue];
    xApproxRod = [0,xApprox];
    yApproxRod = [0,yApprox];
    
    % Plot aesthetics based on sample
    plot(xTrueRod,yTrueRod,'Color',[0 113/255 188/255],'LineWidth',2); % Plot rod for true pendulum
    hold on;
    plot(0,0,'bo','MarkerFaceColor','b','MarkerSize',8); % Plot pivot point
    plot(xTrue,yTrue,'bo','MarkerFaceColor','b','MarkerSize',15); % Plot 'mass' for true pendulum
    
    plot(xApproxRod,yApproxRod,'r','LineWidth',2); % Plot rod for approximated pendulum
    plot(xApprox,yApprox,'ro','MarkerFaceColor','r','MarkerSize',15); % Plot 'mass' for approximated pendulum
    xlim([-2,2]); ylim([-2,2]);
    hold off;
    M(i) = getframe(gcf);
end
end