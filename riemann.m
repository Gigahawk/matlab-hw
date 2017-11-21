function g = riemann( f, nrect, xi, xf, offset )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    syms x;
    
    assert(offset >= 0 && offset <=1, 'Offset must be between 0 and 1')
    
    
    sum = 0;
    
    delta = xf - xi
    
    dx = delta/nrect
    
    shifti = offset;
    shiftf = 1-offset;
    
    xi = xi + shifti*dx
    xf = xf - shiftf*dx
    
    while xi <= xf
        add = dx*subs(f,x,xi)
        sum = sum + add
        xi = xi + dx
    end
    
	sum
end

