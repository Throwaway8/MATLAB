
% constant surface temperature during the summer
Ti = 5;
% constant surface temperature during the winter
Ts = -100; 
% coefficient of thermal conductivity 
a = .000000104; 
% number of seconds in 1 year
t = 31536000; 
% Temperature at which vodka freezes
vF = -27; 
f = @(x)(Ti - Ts)*erf((x/(2*sqrt(a*t)))) + Ts - vF; % T(x,t)
df = @(x)(Ti - Ts)*exp(1)^(-x^2/(4*a*t))/(sqrt(pi)*sqrt(a*t));
% ------------------------------------------------------------
% outputing values
y = newtonsMethod(f, df, 5.073, 1e-20, 20) % outputing values




