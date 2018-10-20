% constant surface temperature during the summer
Ti = 5;
% constant surface temperature during the winter
Ts = -200; 
% coefficient of thermal conductivity 
a = .000000104; 
% depth pipe is burried at
d = 2.628444348576327; 
% Temperature at which vodka freezes
vF = -27; 
% T(x,t) 
f = @(x)(Ti - Ts)*erf((d/(2*sqrt(a*x)))) + Ts - vF; 
df = @(x) (Ti - Ts)*(a*d*exp(1)^(-(d^2)/(4*a*x)))/(2*sqrt(pi)*((a*x)^(3/2)));
% ---------------------------------------------------------------------------
% dividing by 86400 to put it in terms of days. Evaluating T(x,t) with the
% bisection method to approximate the amount of days it will take the vodka
% to freeze.
y = bisectionMethod(f, 1000000, 26000000, 1e-20, 20)/86400 