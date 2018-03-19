prelab

clf('reset');

subplot(1,2,1);
hold on;
% Remove bold font and add a blank line to prevent overlap with axis
title({'\rm PV Trajectory for Ideal Otto Cycle (linear scales)';''});
xlabel('Volume V (m^3)');
ylabel('Pressure P (Pa)');
fplot(pSol_i,[V_2,V_1],'b');
fplot(pSol_f,[V_3,V_4],'b');
plot([V_2,V_3],[P_2,P_3],'r');

subplot(1,2,2);
hold on;
% Remove bold font and add a blank line to prevent overlap with axis
title({'\rm PV Trajectory for Ideal Otto Cycle (log10 scales)';''});
xlabel('log_{10}(V/V_1)');
ylabel('log_{10}(P/P_1)');
% Cheating a little here but its good enough
plot(log10([V_2,V_3]/V_1),log10([P_2,P_3]/P_1),'r');
plot(log10([V_2,V_1]/V_1),log10([P_2,P_1]/P_1),'b');
plot(log10([V_3,V_4]/V_1),log10([P_3,P_4]/P_1),'b');

savefig('idealotto.fig');

