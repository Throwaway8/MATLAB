% =========================================================================
% AUTHOR ..... [Thomas/Alisha]
% UPDATED .... [Jan 27 2018]
%
% Use the bisection method to find a root of a function with initial
% guesses a and b. The root will be computed to within a given tolerance.
%
% INPUT
%   f .......... Function handle for the function f(x) being solved
%   a .......... Left endpoint of interval
%   b .......... Right endpoint of interval
%   maxIter .... Maximum number of iterations
%   tol ........ Tolerance for the solution
%
% OUTPUT
%   c .... A vector containing the iterates of the bisection method with at
%          most maxIter elements. Each element of c is the midpoint between
%          a and b at each iteration:
%              c(i) = (a + b)/2
%          The last element of c is such that
%             abs(f(c(end))) < tol
%          unless c has exactly maxIter elements in which case the
%          iteration may not have converged.
%
% ASSUMPTIONS
%   1. f(a)*f(b) < 0
% 2.a<b
% =========================================================================
function c = bisectionMethod(f,a,b,tol,maxIter) % function and its inputs
    i = 1; % initialize the iteration count
    % initialize c as a vector to store all the iterations
    c = zeros(1,maxIter); 
    while i <= maxIter % beginning of loop
        c(i) = (a + b)/2;
        % end loop if approximation is within user given input
        if abs(f(c(i))) <= tol 
        break;
        end
        % condition to set up more precise boundary intervals 
        if f(a)*f(c(i)) > 0 
            a = c(i);
        else 
            b = c(i);
        % proceed to next iteration in the loop
        i = i + 1; 
        
        
        end
    end
end