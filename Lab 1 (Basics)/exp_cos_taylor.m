function exp_cos_taylor( k, w )
% Plots the function f(x) = e^(-kx^2)*cos(wx)
% as well as it's first 6 taylor polynomials.
% Written by Jasper Chan (37467164)

c = min(4*pi/abs(w),sqrt(2/abs(k)));
x = linspace(-c,c,1000);

f = exp(-k.*x.^2).*cos(w.*x);
d2 = 1 - (w^2/2+k).*x.^2;
d4 = d2 + (k^2/2+k*w^2/2+w^4/24).*x.^4;
d6 = d4 - (k^3/6+k^2*w^2/4+k*w^4/24+w^6/720).*x.^6;

plot(x,f,'k')

m_title = ['Taylor polynomials of f(x) = exp(', num2str(-k),'x^2)*cos(',num2str(w),'x)'];
title(m_title);

xlabel('x values')
ylabel('y values')


hold on
grid on
xlim([-c,c])
ylim([-2,2])

xticks([-c:0.5:c])

plot(x,d2,'b')
plot(x,d4,'r')
plot(x,d6,'g')

hold off

legend('f(x)','Degree 2', 'Degree 4', 'Degree 6');

end
