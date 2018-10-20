% subinterval values of n to evaluate with the error function
f = @(x) exp(-(x.^2)); % Function being inegrated with approximation methods
n = [10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000]; 
da = 0;
db = -0.7357;
% Corrected Trapezoid
errorC = zeros(1, length(n));
for k = 1:length(n)
    T(k) = (2/sqrt(pi))*corrTrap(f, 0, 1, n(k), da, db);
    errorC(k) = abs(erf(1) - T(k));
end
% Midpoint rule
errorM = zeros(1, length(n));
for k = 1:length(n)
    S(k) = (2/sqrt(pi))*midpointRule(f, 0, 1, n(k));
    errorM(k) = abs(erf(1) - S(k));
end
errorM;
% Simpsons Rule
errorS = zeros(1, length(n));
for k = 1:length(n)
    H(k) = (2/sqrt(pi))*simpsonsRule(f, 0, 1, n(k));
    errorS(k) = abs(erf(1) - H(k));
end
errorS;
% Trapezoid Rule
errorT = zeros(1, length(n));
for k = 1:length(n)
    W(k) = (2/sqrt(pi))*trapezoidRule(f, 0, 1, n(k));
    errorT(k) = abs(erf(1) - W(k));
end
errorT;


figure
loglog(n, errorC, n, errorM, n, errorS, n, errorT)   
legend('corrTrap', 'midpoint', 'simpsons', 'trapezoid')    
xlabel('n subintervals')
ylabel('forward error values')
title('Numerical Integration of the Error Function')
    
% Question 3:
% Simpson's Rule has the quickest convergence rate. It works the quickest
% out of any of the other methods because it approximates the function with
% quadratic subintervals than linear subintervals. The corrected trapezoid
% method is the second fastest using the derivatives at the end points to
% help appproximate the curve. The other two methods Midpoint and Trapezoid
% are effectively equal.

% Question 4;
% You can't use this for the corrected trapezoid rule because the
% derivative is 1/2(cosx/sqrt(six)) which will lead to infinity from the
% denominator term.