% Comparing the forward and backward errors on a plot using Newton's method
% and Bisection method.

%-------------------------------------------------------------------------
% A function f evaluating the sqrt(2)
f = @(x) x.^2 - 2;

% Derivative of f needed for newtons method
df = @(x) 2*x;

% Assingning x1 as the approximation to sqrt(2) using Newton's method and
% containing all iterations into a vector
x1 = newtonsMethod(f, df, 1.5, 1e-10, 10); 

% Assingning x2 as the approximation to sqrt(2) using bisection method and
% containing all iterations in a vector
x2 = bisectionMethod(f, 1.3, 1.5, 1e-10, 10);

% Forward error pertaining to bisection approximation of sqrt(2)
ferrBisection = abs(sqrt(2) - x2);

% Forward error pertaining to newton's approximation of sqrt(2)
ferrNewtons = abs(sqrt(2) - x1);

% Backward error pertaining to newton's approximation of sqrt(2)
berrNewtons = abs(f(x1));

% Backward error pertaining to bisection approximation of sqrt(2)
berrBisection = abs(f(x2));

% Plotting error values with a logarithmic scale against their number of
% iterations
semilogy(0:length(ferrNewtons)-1, ferrNewtons, 1:length(ferrBisection), ferrBisection, 0:length(berrNewtons)-1, berrNewtons, 1:length(berrBisection), berrBisection)

legend('ferrBisection', 'ferrNewtons', 'berrNewtons', 'berrBisection')

xlabel('Iteration Count');% x-axis label
ylabel('Error Magnitude');% y-axis label
title('Plot of Error Using Newtons and Bisection Approx') 

% relative error calculations
reN = sqrt(2) - x1(end);

reB = sqrt(2) - x2(end);

