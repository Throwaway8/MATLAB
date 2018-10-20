A = rand(3000,3000);
b = rand(1,3000);


for k = 1:3
    disp('backslash time')
    tic;
    x = A\b';
    r = toc;
    disp(r)
    disp('residual value')
    e = norm(A*x - b')/norm(b);
    disp(e)
end


for k = 1:3
    disp('QR factorization time')
    tic
    [Q,R] = qr(A);
    x = R\Q'*b';
    e = toc;
    disp(e)
    disp('residual value')
    r = norm(A*x - b')/norm(b);
    disp(r)
end

% QR factorization takes the longest amount of times and the residual
% values are all failry small.
for k = 1:3
    disp('inverse dvsn time')
    tic
    x = inv(A)*b';
    f = toc;
    disp(f)
    disp('residual value')
    r = norm(A*x - b')/norm(b);
    disp(r)
end



