f = @(x) ((tan(x)).^2)./(sec(x) + 1);
g = @(x) sec(x) - 1;
x = logspace(-11, -7, 2018);
semilogx(x, (f(x)./g(x)) - 1, 'k.')
disp(abs(f(1) - g(1)))