% Setup the figure
h = 7;
w = 10;
figure('Units','Inches','Position',[ 0 0 w h ]);
set(gcf,'PaperSize', [w h], 'PaperPositionMode', 'auto');

colormap(jet);

kel=273.15;

R_s = 287; %J/kg K

subplot(2,2,1);
t = linspace(0,1000,10);
v = logspace(0,-3,25);
[T,V] = meshgrid(t,v);
P = (R_s*(T+kel))./V/10^6;
surf(T,V,P);
set(gca,'YScale','log');
set(gca,'YDir','reverse');
zlim([0,50]);
xticks([0:200:1000]);
yticks(logspace(-3,0,4));
zticks([0:10:50]);
xlabel('T (Celsius)');
ylabel('v (m^3/kg)');
zlabel('P (MPa)');
grid on;

subplot(2,2,2);
t = linspace(0,1000,10);
v = logspace(1,-3);
[T,V] = meshgrid(t,v);
P = (R_s*(T+kel))./V/10^6;
levels = logspace(-3,-1,20);
contourf(T,P,V,levels);
c = colorbar('Ticks', [0.01:0.01:0.1]);
c.Label.String = 'v (m^3/kg)';
xticks([0:200:1000]);
yticks([0:10:50]);
xlabel('T (Celsius)');
ylabel('P (MPa)');
grid on;

ylim([0,50]);
subplot(2,2,3);
v = logspace(0,-3);
t = linspace(0,1000000);
[T,V] = meshgrid(t,v);
P = (R_s*(T+kel))./V/10^6;
levels = linspace(0,1000,6);
contourf(V,P,T,levels);
xlabel('v (m^3/kg)');
set(gca,'XScale','log');
ylabel('P (MPa)');
ylim([0,50]);
xticks(logspace(-3,0,4));
yticks([0:10:50]);
c = colorbar('Ticks', [0:200:1000]);
c.Label.String = 'T (Celsius)';
grid on;

subplot(2,2,4);
v = logspace(0,-3);
t = linspace(0,1000);
[T,V] = meshgrid(t,v);
P = (R_s*(T+kel))./V/10^6;
levels = logspace(-0.5,2,11);
contourf(V,T,P,levels);
xlabel('v (m^3/kg)');
set(gca,'XScale','log');
ylabel('T (Celsius)');
c = colorbar('Ticks', [10:10:100]);
c.Label.String = 'P (MPa)';
xticks(logspace(-3,0,4));
yticks([0:200:1000]);
grid on;

print('ideal_gas.png','-dpng','-r300');
