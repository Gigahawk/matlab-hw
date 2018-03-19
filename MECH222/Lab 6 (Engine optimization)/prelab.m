syms P(V);
k = 1.4;
[P_1, V_1, T_1] = deal(1.01*10^5, 5.556*10^-4,333);
V_2 = 0.556*10^-4;
Q_23 = 1800;
ode = diff(P,V) == -k*P/V;

% PL1
cond_i = P(V_1) == P_1; % Set initial condition to solve for C
pSol_i(V) = simplify(dsolve(ode,cond_i));

% PL2
P_2 = pSol_i(V_2);
T_2 = T_1*(P_2/P_1)*(V_2/V_1);
% Round off digits to make readable
P_2d = double(P_2)
T_2d = double(T_2)

% PL3
V_3 = V_2;
P_3 = (k-1)/V_3*Q_23;
T_3 = T_2*(P_3/P_2);
% Round off digits to make readable
P_3d = double(P_3)
T_3d = double(T_3)

% PL4
V_4 = V_1;
cond_f = P(V_3) == P_3;
pSol_f(V) = simplify(dsolve(ode,cond_f));
P_4 = pSol_f(V_4);
T_4 = T_1*(P_4/P_1);
% Round off digits to make readable
P_4d = double(P_4)
T_4d = double(T_4)


