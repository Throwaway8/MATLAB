% example of solving ode 

f = @(t, y) -sqrt(y);
sol = ode45(f,[0, 1], 1);

t = linspace(0, 1, 2018);
y = deval(sol, t);

figure
plot(t, y);

[y, dy] = deval(sol, t);
residual = dy - f(t, y);

plot(t, residual, 'r')

