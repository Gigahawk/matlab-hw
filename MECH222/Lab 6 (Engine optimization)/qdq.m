% QDQ - Cumulative heat function and its derivative
%  [Q,DQ] = QDQ(THETA)
% THETA must be in radians. Function is correctly vectorized.
% Reads global variables THETA_S, THETA_B, QBAR

% Philip D Loewen, 2010-02-24, revised by Simon Tse 2014-03-19.

function [Q,dQ] = qdq(theta)

global GLOBAL_ENGINE_PAR % To get access the GLOBAL_ENGINE_PAR.

% Make local copies to make formulas more readable, which are stored in
% this function's workspace ONLY.
THETA_S = GLOBAL_ENGINE_PAR.THETA_S; 
THETA_B = GLOBAL_ENGINE_PAR.THETA_B;
QBAR    = GLOBAL_ENGINE_PAR.QBAR;

% Remind user of the mathematical assumption.
if min(theta) > pi || max(theta) < -pi
    % Execution of this function will be stopped after the error statement.
    error('Crank angles should be given in [-pi,pi]')
end

% Initialize return vectors with all zeros, which are correct values when
% theta < theta_b (before burning happens, no heat is generated).
Q  = zeros(size(theta));
dQ = zeros(size(theta));

% Assign nonzero entries to each subinterval for the piecewise function.
for n = 1:length(theta)
    if theta(n) > THETA_S+THETA_B
        Q(n) = QBAR; % dQ(n) = 0, which is already so.
    elseif theta(n) > THETA_S
        Q(n) = QBAR/2 * (1-cos(pi*(theta(n)-THETA_S)/THETA_B));
        dQ(n) = QBAR/2 * (pi/THETA_B)*sin(pi*(theta(n)-THETA_S)/THETA_B);
    end
end

%% A fancy way that forsakes for-loop is to use Matlab logical indexing:

%% Get arrays of 1 (true) or 0 (false) with same size as theta
% last = theta > THETA_S+THETA_B; % last subinterval
% mid = (theta > THETA_S) && (theta < THETA_S+THETA_B);
%
%% Now only the entries with 1's will be assigned new values.
% Q(last) = QBAR;
% Q(mid) = QBAR/2 * (1-cos(pi*(theta(mid)-THETA_S)/THETA_B));
% dQ(mid) = QBAR/2 * (pi/THETA_B)*sin(pi*(theta(mid)-THETA_S)/THETA_B);
