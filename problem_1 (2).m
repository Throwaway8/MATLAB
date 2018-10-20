

for n = 1:20
    for i = 1:200
        A = 2*rand(n) - 1;
        l = randi([1,n^2],1);
        A(l) = 1e10;
        [L, U] = LU_nopivot(A);
        berrNo = norm(L*U - A);
        [L, U, P] = lu(A);
        berrPa = norm(L*U - P*A);
        [L, U, P, Q] = LU_cp(A);
        berrCp = norm(L*U - P*A*Q);
        [L, U, P, Q] = luRook(A);
        berrRp = norm(L*U - P*A*Q);
    end 
end