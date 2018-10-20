% Interpolating the error function using Chebyshev nodes.
n = 19;
tau = zeros(1,length(n));
x = linspace(-10,10,100);
max_error = zeros(1,21);

% Computing Chebyshev nodes.
for k = 1 : n
   tau(k) = 10*cos(pi - ((pi*(k-1)/(n-1))));
end

% Computing solution values of error function using our computed Chebysev
% nodes question 1.
rho = erf(tau);
p = baryeval2(tau, rho, x);

% Computing values of the erf(x) at the 'n' chebyshev nodes question 2.
err = abs(erf(x) - p);

%Computing the error values from n=10 to n=30 question 3.
for n = 10 : 30
    k = 1:(n+1);
    tau(k) = 10*cos(pi - ((pi*(k-1)./(n))));
    rho = erf(tau);
    p = baryeval2(tau, rho, x);
    max_error(n-9) = max(abs(erf(x) - p));
end

% Question 1 interpolation plot.
figure
plot(x, p, tau, rho, 'o')
title('Barycentric Second Form Interp. of the Error Function, Chebyshev');
xlabel('X bounded through -10 to 10');
ylabel('Error Function Output');
% Question 2 Interpolation plot.
figure
semilogy(x, err)
title('Plot of the Error in your Computed Interpolant, Chebyshev')
xlabel('X bounded erf(x) from -10 to 10')
ylabel('Absolute Value of the Error')
% Question 3 Interpolation plot.
figure
plot(10:30, max_error, 'o-')
title('Max Error with Variable Values of N, Chebyshev')
xlabel('N Values from 10 to 30')
ylabel('Value of Max error')