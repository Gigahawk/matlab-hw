function three_body_euler(m1,S1,m2,S2,P,tspan)
% Plot the trajectory of a planet orbiting two stars fixed in space

% For readability
xS1 = S1(1);
yS1 = S1(2);

xS2 = S2(1);
yS2 = S2(2);

    function dudt = orbit(t,u)
        dudt = zeros(4,1);
        dudt(1) = u(2);
        dudt(2) = 4*pi^2*(m1*(xS1-u(1))/((xS1-u(1))^2+(yS1-u(3))^2)^(3/2) + m2*((xS2-u(1))/((xS2-u(1))^2+(yS2-u(3))^2)^(3/2)));
        dudt(3) = u(4);
        dudt(4) = 4*pi^2*(m1*(yS1-u(3))/((xS1-u(1))^2+(yS1-u(3))^2)^(3/2) + m2*((yS2-u(3))/((xS2-u(1))^2+(yS2-u(3))^2)^(3/2)));
    end

options = odeset('RelTol',1e-9,'AbsTol',1e-10);
[T,U] = ode45(@orbit,tspan,P,options);

figure;
hold on;
grid on;

plot(U(:,1),U(:,3));
plot(xS1,yS1,'r*')
plot(xS2,yS2,'r*')

for i = 1:length(T)
    if exist('planet','var')
        delete(planet);
    end
    planet = plot(U(i,1),U(i,3),'o','Color',[57/255 130/255 90/255],'MarkerFaceColor',[57/255 130/255 90/255]);
    drawnow
end

hold off;

end
