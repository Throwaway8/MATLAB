% Richard Gooding/ Jose Lopez/ Thomas Devries
% solving for the backward error between four different methods of LU
% decomp to compare which one is more exact given different sizes of
% matrices and values in the matrix
%---------------------------------------------------------

x = 1:20;
NpLU = zeros(1, 20);
PaLU = zeros(1, 20);
CpLU = zeros(1, 20);
RpLU = zeros(1, 20);
for n = 1:20
    for i = 1:200
        A = 2*rand(n) - 1; % creating matrices
        l = randi([1,n^2],1); 
        A(l) = 1e10; % adding large values to cumputed matrices
        % no pivot LU decomp and its backward error computed
        [L, U] = LU_nopivot(A);
        berrNo = norm(L*U - A);
        % partial pivot LU decomp and its backward error computed
        [L, U, P] = lu(A);
        berrPa = norm(L*U - P*A);
        % complete pivot LU decomp and backward error computed
        [L, U, P, Q] = LU_cp(A);
        berrCp = norm(L*U - P*A*Q);
        % roo pivot method LU decomp and backward error computed
        [L, U, P, Q] = luRook(A);
        berrRp = norm(L*U - P*A*Q);
        
        NpLU(n) = NpLU(n) + berrNo;
        PaLU(n) = PaLU(n) + berrPa;
        CpLU(n) = CpLU(n) + berrCp;
        RpLU(n) = RpLU(n) + berrRp;
    end 
    NpLU = NpLU/20; % average vaues for no pivot method
    PaLU = PaLU/20; % average values for partial pivot method
    CpLU = CpLU/20; % avergage values for complete pivot
    RpLU = RpLU/20; % avergae values for rook pivot method
end

figure
semilogy(x, NpLU, x, PaLU, x, CpLU, x, RpLU)   
title('Comparing LU Cecomp Methods')
xlabel('Number of Matrices')
ylabel('Average Error Values')
legend('no pivot', 'partial pivot', 'complete pivot', 'rook pivot')