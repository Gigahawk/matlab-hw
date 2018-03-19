% VDV - Calculate volume function and its derivative:
%  [V,DV] = VDV(THETA)
% THETA must be in radians. Function is correctly vectorized.
% Reads global variables V_D, R, R1

% Philip D Loewen, 2010-02-24; 2011-03-15, revised by Simon Tse 2014-03-19.

function [V,dV] = vdv(theta)

global GLOBAL_ENGINE_PAR % To get access the GLOBAL_ENGINE_PAR.

% Make local copies to make formulas more readable, which are stored in
% this function's workspace ONLY.
V_D = GLOBAL_ENGINE_PAR.V_D; 
r = GLOBAL_ENGINE_PAR.r;   
R1 = GLOBAL_ENGINE_PAR.R1;

% Compute the square root just once, for efficiency and clarity:
radical = sqrt(R1^2-sin(theta).^2);

V = V_D/(r-1) + V_D/2 * (1+R1-cos(theta)-radical);
dV = V_D/2 * sin(theta) .* (1+cos(theta)./radical);
