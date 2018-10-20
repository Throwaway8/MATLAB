% random matrix
B = rand(24,25);
% extracting the last column 
C = B(24,:);
% combinging extracted column and randon matrix
A = [B; C];
% computing determinant of A
d = det(A)
% random solution vector
y = rand(25,1);
% solving  
x = inv(A)*y
% backslash solution
x2 = A\y

% Matlab computes a determinant of 4.47e-18 even though it should be zero
% because matrix A is singular. The solution values it finds are very
% large which are inaccurate. 