function phase_portrait(A,width,height,h,N)
% Plot the phase portrait of the linear system dxdt = Ax
x_quiver = [-width:h:width];
y_quiver = [-height:h:height];

[X,Y] = meshgrid(x_quiver,y_quiver);
U = (A(1,1)*X + A(1,2)*Y) ./ sqrt(X.^2 + Y.^2);
V = (A(2,1)*X + A(2,2)*Y) ./ sqrt(X.^2 + Y.^2);
quiver(X,Y,U,V,0.5);

axis([-width width -height height]);
hold on

L = sqrt(width^2 + height^2);
[K,D] = eig(A)

xnullcline = L * [-A(1,2), A(1,1)] / norm([-A(1,2), A(1,1)]);
plot([-xnullcline(1),xnullcline(1)],[-xnullcline(2),xnullcline(2)],'r--');

ynullcline = L * [-A(2,2), A(2,1)] / norm([-A(2,2), A(2,1)]);
plot([-ynullcline(1),ynullcline(1)],[-ynullcline(2),ynullcline(2)],'r--');

if isreal(D)
    eigslope1 = K(2,1)/K(1,1)
    eigslope2 = K(2,2)/K(1,2)
    plot([-L,L],[-L*eigslope1,L*eigslope1],'b');
    plot([-L,L],[-L*eigslope2,L*eigslope2],'b');
end

plot(0,0,'bo','MarkerFaceColor','b');

options = odeset('Events', @stop);

r_D = real(D);
if any(r_D < 0)
    % Real part is negative (sink)
    disp('Real part is negative (sink)')
    [x,y] = circleDivide(L,N);
    for i = [x';y']
         [T,U] = ode45(@odefun,[0,Inf],[i(1),i(2)],options);
         plot(U(:,1),U(:,2),'b')
    end
elseif any(r_D > 0)
    % Real part is positive (source)
    disp('Real part is positive')
    [x,y] = circleDivide(L,N);
    for i = [x';y']
         [T,U] = ode45(@odefun,[0,-Inf],[i(1),i(2)],options);
         plot(U(:,1),U(:,2),'b')
    end
elseif xor(r_D(1,1) > 0, r_D(2,2) > 0)
    % Saddle point
    disp('Saddle point')
    [x,y] = nullclineDivide(xnullcline,ynullcline,width, height, N);
    for i = [x';y']
        [T,U] = ode45(@odefun,[0,-Inf],[i(1),i(2)],options);
        plot(U(:,1),U(:,2),'b')
        [T,U] = ode45(@odefun,[0,Inf],[i(1),i(2)],options);
        plot(U(:,1),U(:,2),'b')
    end
else
    % Real part is zero (center)
    disp('Real part is zero')
    [x,y] = diagonalDivide(width,height,N)
    beta = imag(D(1,1))
    for i = [x';y']
        [T,U] = ode45(@odefun,[0,2*pi/beta],[i(1),i(2)]);
        plot(U(:,1),U(:,2),'b');
    end
end 
% No case for one eigenvalue at 0

function dpdt = odefun(t,y)
    dpdt = zeros(2,1);
    dpdt(1) = A(1,1)*y(1)+A(1,2)*y(2);
    dpdt(2) = A(2,1)*y(1)+A(2,2)*y(2);
end

function [value,isterminal,direction] = stop(t,y)
    value = [1,1];
    if norm(y) > norm([width,height])
        value(1) = 0;
    end
    if norm(y) < 1e-5
        value(2) = 0;
    end

    isterminal = [1,1];
    direction = [0,0];
end

hold off
end

function [x, y] = circleDivide(L, N)
    theta = linspace(0,2*pi,N+1);
    theta = theta(1:end-1);
    x = [];
    y = [];
    for i = theta
        [x_i,y_i] = pol2cart(i,L);
        x = vertcat(x,x_i);
        y = vertcat(y,y_i);
    end
end

function [x,y] = nullclineDivide(xnc, ync, width, height, N)
    x = [];
    y = [];
    
    widthspan = width*0.8;
    heightspan = height*0.8;
    
    xN = ceil(N/2);
    yN = floor(N/2);
    
    xslope = xnc(2)/xnc(1);
    yslope = ync(2)/ync(1);
    if abs(xnc(1)) > width
        % xnc intercepts left/right
        xcoords = linspace(-widthspan,widthspan,xN);
        for i = xcoords
            x = vertcat(x,i);
            y = vertcat(y,i*xslope);
        end
    else 
        %xnc intercepts top/bottom
        xcoords = linspace(-heightspan,heightspan,xN);
        for i = xcoords
            x = vertcat(x,i/xslope);
            y = vertcat(y,i);
        end
    end
    
    if abs(ync(1)) > width
        ycoords = linspace(-widthspan,widthspan,yN);
        for j = ycoords
            x = vertcat(x,j);
            y = vertcat(y,j*yslope);
        end
    else
        ycoords = linspace(-heightspan,heightspan,yN);
        for j = ycoords
            x = vertcat(x,j/yslope);
            y = vertcat(y,j);
        end
    end
   
end

function [x,y] = diagonalDivide(width,height,N)
    x = linspace(0,width,N)';
    y = linspace(0,height,N)';
end


