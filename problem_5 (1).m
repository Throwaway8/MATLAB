
A = rand(20,20);
% original determinant
d = det(A)

b = A/10;
% determinant after division by 10
d2 = det(b)

% When the determinant is very small it can wrongly be identified as
% singular and mess up your solution when in fact it is not ill
% conditioned.