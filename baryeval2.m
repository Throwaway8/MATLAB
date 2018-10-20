% =========================================================================
% baryeval2
%
% AUTHOR ..... [Your name]
% UPDATED .... [Today's date]
%
% Evaluates the barycentric formula of the second kind.
%
% INPUT
%   tau .... Interpolation nodes
%   rho .... Values to be interpolated
%   x ...... Points at which to evaluate the interpolating polynomial
%
% OUTPUT
% p .... Value of the interpolating polynomial at points x
% ========================================================================= 
function p = baryeval2(tau, rho, x)
% top (numerator) of P(x) initialized as an empty vector sized of x input
t = zeros(1, length(x));
% bottom (denomenator) of P(x) initialized as an empty vector sized of x
% input
b = zeros(1, length(x)); 
% intialize function computing the beta term weights
beta = bary_weights(tau);

% defining top factor of P(x)
for k = 1:length(tau)
    t = t + ((beta(k)*rho(k)) ./ (x - tau(k)));
end
% defining bottom factor of P(x)
for k = 1: length(tau)
    b = b + ((beta(k)) ./ (x - tau(k)));
end
% Calculating values of P(x)
p = t./b;
end





