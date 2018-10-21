% Interpolation using the barycentric weighted form of Lagrange polynomial, w = baryweights function 

function y = baryeval1(tau, rho, x)
% initialize beta as a vector of ones 
beta = ones(1, length(tau));
% initialize w(x) as a vector of ones
w = ones(1, length(x));
% defining w(x), as the recursive product 1:length(tau)->(1:4)
for k = 1:length(tau)
    w = w.*(x - tau(k));
end
% Defining beta function within do alternately iterate through k and j
for k = 1:length(tau)
    for j = 1:length(tau)
        if k ~= j
            beta(k) = (beta(k)) * (1/(tau(k)-tau(j)));
        end
    end
end
% defining the function
f = zeros(1,length(x));
% summation of the node terms
for k = 1:length(tau)
    f = f + (beta(k) * rho(k) ./ ((x-tau(k))));
end
% multiply by w
y = w.*f;   
end
    
    
            
        
        
