% Richard Gooding/ Thomas Devries/ Jose Lopez 
%--------------------------------------------------------------------
function [L, U, P, Q] = luRook(A)

L = eye(size(A)); % empty lower triangular matrix to be filled
U = A; % U==A to be the upper triangular matrix
P = eye(size(A)); % empty identity matrix to be used for the permute columns
Q = eye(size(A)); % empty identity matrix used to permute rows 
n = length(A(:,1));
% finding best pivot point
for k = 1:n-1
    [u, v] = findRookPivot(U(k:n,k:n));
    u = u + k-1;
    v = v + k-1;
    p = eye(size(P));
    q = eye(size(Q));
  % flipping rows and columns to permute the matrices and form L, U
    p([u, k],:) = p([k, u],:); 
    q([v, k],:) = q([k, v],:);
    P = p*P;
    Q = Q*q;
    L = p*L*p;
    U = p*U*q;
    if U(k,k) == 0
        error('zero encountered');
    end 
    rho = (k+1):n;
    L(rho, k) = U(rho, k) / U(k,k);
    U(rho, k) = 0;
    U(rho, rho) = U(rho, rho) - L(rho, k)*U(k,rho);
end
end
    
    
    
    