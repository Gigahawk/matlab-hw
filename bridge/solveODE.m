function [ t,x ] = solveODE( b, c, f, x0, x1, T)
%SOLVEODE Solves the second order ODE x'' + b x' + c x = f(t) 
% in the interval [0,T], numerically. x0 = x(0), x1 = x'(0) are the initial
% conditions.

%Returns two arrays t and x. t returns the times at which we have an
%approximation for x, which is stored in x.

assert(~isnan(b)&&~isnan(x0)&&~isnan(x1)) 
%Makes sure that you don't have nans in initial values or x0,x1.

z0 = [x0; x1]; 
[t,z] = ode15s( @F, [0 T], z0 );
x = z(:,1);

    function [z1] = F(t,z0)
        z1 = [z0(2); -b * z0(2) - c * z0(1) + f(t)];
    end

end

