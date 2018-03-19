activity1

res = 0.001;
GLOBAL_ENGINE_PAR.THETA_S = deg2rad(-40);
GLOBAL_ENGINE_PAR.THETA_B = deg2rad(30);
theta = [-pi:res:pi];

[P,dP] = pdp(theta);
[V,dV] = vdv(theta);

subplot(1,2,1);
title({'\rm PV Trajectory in Non−instantaneous Burn (linear scales)',''});
plot(V,P,'g');

subplot(1,2,2);
title({'\rm PV Trajectory in Non−instantaneous Burn (log scales)',''});
plot(log10(V/V_1),log10(P/P_1),'g');

savefig('realotto.fig');

