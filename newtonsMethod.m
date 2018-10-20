% -------------------------------------------------------------------------
% FUNCTION: newtonsMethod
%
% AUTHOR ... [Thomas/Alisha]
% DATE ..... [Jan 27 2018]
%
% Use Newton's method to find a root of a function given an initial
% guess. The root will be computed to within a given tolerance.
%
% INPUT
%   f ......... Function handle for the function f(x) being solved
%   df ........ Function handle for the derivative f'(x) of f(x)
%   x0 ........ Initial guess for the solution
%   tol ....... Tolerance wanted in the solution
%   maxIter ... Maximum number of iterations
%
% OUTPUT
%   x ... A vector containing the iterates of Newtons method with at most
%         maxIter+1 elements. x(1) = x0 and the last element of x is such
% that
%            abs(f(x(end))) < tol
%         unless x has exactly maxIter+1 elements in which case the
% iteration may not have converged.
% -------------------------------------------------------------------------
function x = newtonsMethod(f, df, x0, tol, maxIter)
    i = 1; % intialize iteration count
    x = zeros(1,maxIter); % Assign x as a vector of the length it takes to find the root
    x(1) = x0;
    while i <= maxIter % if it doesn't find a root withing our desired iterations, end 
        x(i+1) = x(i) - f(x(i))/df(x(i)); % newtons aprrox. formula
        if abs(f(x(i+1))) < tol % Testing value againt our tolerance limit quitting if close enough to zero
            x = x(1:i+1); % Storing each iteration into our initial empty vector x
            break;       
        end
        i = i+1;       
    end
end
        
