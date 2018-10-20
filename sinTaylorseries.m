%Truncated taylor series for sin(x)

% =========================================================================
% AUTHOR ..... [Thomas Devries]
% UPDATED .... [Jan 19 2018]
%
% Evaluate the truncated Taylor series for exp(x) about the point x0 = 0
%
% INPUT
%   x .... Vector of values to evaluate the Taylor series at
%   n .... Integer of last term to evaluate in Taylor series
%
% OUTPUT
% T : Evaluated Taylor series at points given by x to n terms
% ========================================================================
function T = sinTaylorseries(x,n)
    %T is initially zero
    T = 0;
    %Taylor series expansion around x of sin(x)
    for k = 0:n
    T = T+(((-1).^k)/factorial(2*k+1))*x.^(2*k+1); % expansion formula 
    end
end
    
