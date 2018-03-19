function [W, eta] = enginetune(theta_s,theta_b)
% Access global values, and remember them before modifying them.
global GLOBAL_ENGINE_PAR
GLOBAL_ENGINE_PAR_SAVE = GLOBAL_ENGINE_PAR;

% User input signals temporary manual override. 
% Will affect the call to qdq directly and pdp indirectly in the main body.
if nargin == 2 % Check number of inputs. 
	GLOBAL_ENGINE_PAR.THETA_S = theta_s;
	GLOBAL_ENGINE_PAR.THETA_B = theta_b;
end

% =========================================================================
% Your code, the main body that computes and assigns W and eta. 
% User override of theta_s, theta_b is now in effect (if provided).
% =========================================================================

% Last line, revert the global variable back to its original values.
GLOBAL_ENGINE_PAR = GLOBAL_ENGINE_PAR_SAVE; 