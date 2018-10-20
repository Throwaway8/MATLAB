% Thomas Devries/ Jose/ Richard Gooding
% showing that the forward error of exp(cos(x)) from 0 --> 2pi using the
% trapezoid rule converges expceptionally fast.
% ------------------------------------------------------------------------------------------
f = @(x) exp(cos(x)); % function being integrated
n = floor(logspace(1, 5, 30)); % n values to be integrated at
a = 0; % lower bound
b = 2*pi; % upper bound

exact = 2*pi*(besseli(0,1)); % exact value of integral
d2f = @(x) exp(cos(x))*((sin(x))^2 - cos(x)); % second derivative 
d4f = @(x) -(1/8)*(-4*cos(x)+24*cos(2*x)+12*cos(3*x)+cos(4*x)-1); % fourth derivate
K = abs(d2f(2*pi)); % constant for bound error function
Kc = abs(d4f(pi));

ferr = zeros(1,length(n)); % vector to contain forward error values
terrb = zeros(1,length(n)); % vector to contain trapezoid bound error function values
cerrb = zeros(1,length(n)); % vector to contain composite trapezoid bound error function values
for i = 1:length(n)
    h = (b - a)/n(i);
    t = Trap(f, 0, 2*pi, n(i));
    ferr(i) = abs(exact - t); % forward error calculated at each n value
    terrb(i) = (1/12)*(h^2)*(b - a)*(K); % formula values for trapezoid rule
    cerrb(i) = (1/720)*(h^4)*(b - a)*Kc; % formula values for composite trapezoid rule
end
% plotting
loglog(n, ferr,  n, terrb, n, cerrb)
xlabel('n trapezoids')
ylabel('Error Formula/Forard Error Values')
title('Comparing convergence rate for exp(cos(x)) Forward Error')
legend('forward error', 'trapezoid formula (1/n^2)', 'composite formula (1/n^4)')
    
    