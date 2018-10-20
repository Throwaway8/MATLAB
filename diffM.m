% Richard Gooding/Thomas Devries/Jose Lopez
% Forming a differential matrix to perform integration with
%---------------------------------------------------------------
function [D, p] = diffM(n)
%computing chebyshev nodes tau
%computing values at tau nodes for vector 'p'
tau = cos(pi*(0:n)/n);
p = 1./(1 + tau.^2);
% Computing beta weights
beta = ones(size(tau));
for i = 1:n+1
    for j = 1:n+1
        if i ~= j
            beta(j) = beta(j)/(tau(j) - tau(i));
        end
    end
end
% initializing empty matrix D to be filled
D = zeros(n+1);
% computing entries for D
for i = 1:n+1
    for j = 1:n+1
        if i ~= j
            D(i,j) = beta(j)/((tau(i) - tau(j))*beta(i));
        end
    end
     
    D(i,i) = -sum(D(i,:));    
end
end

            
       
  
    

    
            
            





    