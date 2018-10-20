% Uniformly spaced nodes interpolating the error function using the barycentric polynomial in its
% second form. 
n = 19;
tau = zeros(1, length(n));
x = linspace(-10,10,2000);
max_error = zeros(1,21);
for k = 1 : n
    tau(k) = -10 + 20*((k-1)/(n-1));
end

% Compute rho(y) values of the error function and putting it into its barycentric form. 
rho = erf(tau);
p = baryeval2(tau, rho, x);

% Uniform nodes question 1 plot of the error function from x:10,10.
figure 
plot(x, p, tau, rho, 'o-')
title('Barycentric Second Form Tnterp. of the Error Function, Equispace');
xlabel('X bounded through -10 to 10');
ylabel('Error Function Output');

% Uniform nodes question 2 plot. Plotting the difference between the absolute value of the actual
% value compared to the interpolant's value.
err = abs(erf(x) - p);
figure 
semilogy(x, err)
title('Plot of the Error in your Computed Interpolant, Equispace')
xlabel('X bounded erf(x) from -10 to 10')
ylabel('Absolute Value of the Error')

% For n:10->30 computing the error value for each n with respect to the
% error functions value.
for n = 10 : 30
    k = 1:(n+1);
    tau(k) = -10 + 20*((k-1)/(n-1));
    rho = erf(tau);
    p = baryeval2(tau, rho, x);
    max_error(n-9) = max(abs(erf(x) - p));
end

% Uniform nodes question 3 plot. Plotting the error per 'n' compared to the
% function value.
figure
plot(10:30, max_error, 'o-')
title('Max Error with Variable Values of N, Equispace')
xlabel('N Values from 10 to 30')
ylabel('Value of Max error')
