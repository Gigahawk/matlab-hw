cyclesetup

res = 0.0001;
GLOBAL_ENGINE_PAR.THETA_S = deg2rad(-40);
GLOBAL_ENGINE_PAR.THETA_B = deg2rad(30);
theta_s = GLOBAL_ENGINE_PAR.THETA_S;
theta_b = GLOBAL_ENGINE_PAR.THETA_B;
theta = [-pi:res:pi];
theta_1 = [-pi:res:theta_s];
theta_2 = [theta_s:res:theta_s + theta_b];
theta_3 = [theta_s + theta_b:res:pi];

clf('reset');
[V,dV] = vdv(theta);

subplot(2,1,1);
hold on;
title('\rm Volume vs Crank Angle');
xlabel('Angle \theta (rad)');
ylabel('Volume V(\theta) (m^3)');
xlim([-pi,pi]);
plot(theta,V);

subplot(2,1,2);
hold on;
title('\rm Volume Change Rate dV/d\theta vs Crank Angle \theta');
xlabel('Angle \theta (rad)');
ylabel('dV/d\theta (m^3/rad)');
xlim([-pi,pi]);
plot(theta,dV);

savefig('vdvplot.fig');

input('Press enter to continue','s');

clf('reset');
[Q_1,dQ_1] = qdq(theta_1);
[Q_2,dQ_2] = qdq(theta_2);
[Q_3,dQ_3] = qdq(theta_3);

subplot(2,1,1);
hold on;
title('\rm Cumulative Heat Added vs Crank Angle');
xlabel('Angle \theta (rad)');
ylabel('Heat added Q(\theta) (J)');
xlim([-pi,pi]);
%ylim([-10,2000]); % This crashes it
set(gca,'ylim',[-100,2000]); % This doesn't, no idea why
plot(theta_1,Q_1,'b');
plot(theta_2,Q_2,'r');
plot(theta_3,Q_3,'b');
ylength = get(gca,'ylim');
plot([theta_s,theta_s],ylength,'b:');
text(theta_s,0,'{\theta_s} ','HorizontalAlignment','right','VerticalAlignment','bottom','Color','b');
plot([theta_s+theta_b,theta_s+theta_b],ylength,'b:');
text(theta_s + theta_b,0,' {\theta_s}+\theta_b','HorizontalAlignment','left','VerticalAlignment','bottom','Color','b');

subplot(2,1,2);
hold on;
title('\rm Heat Addition Rate \delta Q/d\theta vs Crank Angle \theta');
xlabel('Angle \theta (rad)');
ylabel('\delta Q /d\theta (J/rad)');
xlim([-pi,pi]);
%ylim([-10,5000]);
set(gca,'ylim',[-100,6000]);
plot(theta_1,dQ_1,'b');
plot(theta_2,dQ_2,'r');
plot(theta_3,dQ_3,'b');
ylength = get(gca,'ylim');
plot([theta_s,theta_s],ylength,'b:');
text(theta_s,0,'{\theta_s} ','HorizontalAlignment','right','VerticalAlignment','bottom','Color','b');
plot([theta_s+theta_b,theta_s+theta_b],ylength,'b:');
text(theta_s + theta_b,0,' {\theta_s}+\theta_b','HorizontalAlignment','left','VerticalAlignment','bottom','Color','b');

savefig('qdqplot.fig');

