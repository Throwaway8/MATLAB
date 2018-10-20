% example of solving ode

f = @(t, y) [2*y(1) + y(2);
            y(1) - 2*y(2) + y(3);
            y(2) - 2*y(3)];
        
sol = ode15s(f, [0,5], [1, 0, 0]');

t = linspace(0, 5, 2018);
[y, dy] = deval(sol, t);

[~, m] = size(y);

residual = zeros(size(y));
for j = 1:m
    residual(:, j) = dy(:, j) - f(t(j), y(:, j));
end

plot(t, y)
            
