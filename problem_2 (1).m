% Thomas Devries/ Jose/ Richard Gooding
% Showing that the forward error of the trapezoid rule corresponds to
% evaluation (sin(x/2)^3 from 0 --> 2pi coverges at the rate of 1/n^4 not
% 1/n^2.
% ----------------------------------------------------------------------------------------
n = floor(logspace(1,5,200)); % n sub trapezoids
f = @(x) (sin(x/2))^3; % function to be integrated
d2f = @(x) (3/8)*(sin(x/2)).*(3*cos(x) + 1); % second derivative
K = 0.041071854; % error bound function constant
a = 0; % lower bound
b = 2*pi; % upper bound
ferr = zeros(1, length(n)); % empty vector to contain forward error values per every n increase
berr = zeros(1, length(n)); % empty vector to contain bounded error values per every n increase
for i = 1:length(n)
    h = (b - a)/n(i); % increasing number of n trapezoids being integrated successively
    t = Trap(f, a, b, n(i));
    ferr(i) = abs((8/3) - t); % forward error for increasing n trapezoids
    berr(i) = (((h^2)*(b - a))/12)*K; % bounded error function evaluated per increasing n
end
% plotting includes plot of 1/n^2 and 1/n^4 to show the convergences
% relative exactness to those values
semilogy(1:length(n), ferr,'o', 1:length(n), berr,'ko', 1:length(n), 1./n.^2, 1:length(n), 1./n.^4)
xlabel('n-subintervals')
ylabel('forward error/bound error')
legend('forward error', 'bound error', '1/n^2','1/n^4')
title('Comparing the Forward Frror Convergence of the Trapezoid Rule')


    
    
    