% cyclesetup.m - script to set global parameters

% Philip D Loewen, 2011-03-15, revised by Simon Tse 2014-03-19.

% Creates a new variable GLOBAL_ENGINE_PAR in the global workspace.
global GLOBAL_ENGINE_PAR

% Default engine parameters saved into the fields of one global struct:
GLOBAL_ENGINE_PAR.PAMB    = 1.01E5;     % Ambient pressure       (N/m^2)
GLOBAL_ENGINE_PAR.V_D     = 5.E-4;      % Piston displacement    (m^3)
GLOBAL_ENGINE_PAR.R1      =  3.;        % Piston volume ratio    (1)
GLOBAL_ENGINE_PAR.QBAR    = 1800;       % Total heat input       (J)
GLOBAL_ENGINE_PAR.r       = 10.;        % Piston length ratio    (1)
GLOBAL_ENGINE_PAR.k       = 1.4;        % Thermo exponent of gas (1)
% Note: In the lab, the initial pressure P1 is assumed to equal the ambient
% pressure. 

% Need to be modified according to your lab day.
GLOBAL_ENGINE_PAR.THETA_S = 0;          % Spark onset angle      (rad)
GLOBAL_ENGINE_PAR.THETA_B = 0;          % Burn duration angle    (rad)

% Announce them:
fprintf('\nGlobal struct variable GLOBAL_ENGINE_PAR initialized.\n')
GLOBAL_ENGINE_PAR
