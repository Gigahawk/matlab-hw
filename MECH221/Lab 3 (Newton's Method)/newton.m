function [r,n,t] = newton(f, Df, x0, tolerance, max_steps)
% Uses Newton's method of finding roots to find roots

% Apparently symbolic functions are evil so this won't work
% assert(isequaln(diff(f),Df), "Error: Df is not the derivative of f")
format long

n = 0;
r = x0;

%Start timer
tic

while abs(f(r)) >= tolerance
    df = Df(r);
    if ~df
        disp('Program terminated because f''(x)=0. No root found.')
        [r,n,t] = deal(NaN);
        return
    end
    if n >= max_steps
        disp(['Program terminated after ' num2str(n) ' iterations. No root found.'])
        [r,n,t] = deal(NaN);
        return
    end
    r = r - f(r)/df;
    n = n + 1;
end
t = toc;

disp(['Found root ' num2str(r,15) ' after ' num2str(n) ' iterations in ' num2str(t) ' seconds.'])



