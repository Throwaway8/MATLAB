format long
% create random 3000x3000 matrix
i = rand(3000,3000);
% creating matrix with first and second 3000 rows the same
A = [i; i];
% random solution vector
b = rand(6000,1);

% least squares solution
p = inv(A'*A)*A'*b;

r1 = norm(A*p - b)/norm(b);
disp(r1)
% Backslash solution
x = A\b;

r2 = norm(A*x - b)/norm(b);
disp(r2)

%disp(p);

% combing A and b to be reduced
c = [A, b];
% row reducing matrix A to solve showing rref has no solution because the
% rows are scaled combinations of each other.
diff = c(1,:) - c(3001,:)

% the residual values are equal for both methods




