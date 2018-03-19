function [P,dP] = pdp(theta)
% solve for P = P(theta)
global GLOBAL_ENGINE_PAR
P_amb = GLOBAL_ENGINE_PAR.PAMB;

% dpdtheta() access 7 variables from GLOBAL_ENGINE_PAR
[t,P] = ode45(@(x,y) dpdtheta(x,y), theta,P_amb,struct('Reltol',1.E-6));
% Return P as a row vector
P = P.';
dP = dpdtheta(theta,P);

end
