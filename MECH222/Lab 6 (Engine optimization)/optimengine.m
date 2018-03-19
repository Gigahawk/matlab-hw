clear
cyclesetup;
res = 0.001;
GLOBAL_ENGINE_PAR.THETA_S = deg2rad(-40);
GLOBAL_ENGINE_PAR.THETA_B = deg2rad(30);
theta = [-pi:res:pi];
%theta_s = GLOBAL_ENGINE_PAR.THETA_S;
theta_b = GLOBAL_ENGINE_PAR.THETA_B;
theta_s = linspace(-theta_b,theta_b,91);
r = GLOBAL_ENGINE_PAR.r;
k = GLOBAL_ENGINE_PAR.k;

eta_max = 1 - 1/(r^(k-1))
curr_max = eta_max;
max_theta = 0;

figure;
title('Efficiency Ratio \eta/\eta_{max} vs \theta_s');
xlabel('\theta_s (rad)');
ylabel('\eta/\eta_{max}');
hold on;
for i = theta_s
	[~,eta] = enginetune(i,theta_b);
	eff_ratio = eta/eta_max;
	if(eta >= curr_max)
		curr_max = eta;
		max_theta = i;
	end
	plot(i,eff_ratio,'b.');
end

plot(max_theta,curr_max/eta_max,'ro');
savefig('sparkoptim.fig');
max_theta

activity1
GLOBAL_ENGINE_PAR.THETA_S = max_theta;

[P,dP] = pdp(theta);
[V,dV] = vdv(theta);

subplot(1,2,1);
title({'\rm PV Trajectory of Optimized Burn (linear scales)',''});
plot(V,P,'g');

subplot(1,2,2);
title({'\rm PV Trajectory of Optimized Burn (log scales)',''});
plot(log10(V/V_1),log10(P/P_1),'g');

savefig('optimotto.fig');

