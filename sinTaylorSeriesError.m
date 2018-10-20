
% initialize x values boundaries
x = linspace(-2*pi, 2*pi, 2018);
% T is the error value of the series expansion
T = abs(sin(x) - sinTaylorseries(x,10));
% graph of the error values
plot(x,T);

axis([-1, 1, -2*eps, 2*eps]);