% dPdtheta - derivative for function P(theta) in terms of (theta,P(theta))

% Philip D Loewen, 2010-02-24; 2011-03-15, revised by Simon Tse 2014-03-19.

function dP = dpdtheta(theta,P)

global GLOBAL_ENGINE_PAR % To get access the GLOBAL_ENGINE_PAR.
k = GLOBAL_ENGINE_PAR.k; % For readability, k is now a local variable.

[V,dV] = vdv(theta);
[~,dQ] = qdq(theta); % Store only the 2nd output.

dP = -k*P.*dV./V+(k-1).*dQ./V;
