f = @(x) x^2 - 2;
df = @(x) 2*x;
format long
x = newtonsMethod(f, df, -1.2, 1e-10, 20)

y = bisectionMethod(f, 0, 2, 1e-10, 20)

reN = sqrt(2) + x(4)
    
reB = sqrt(2) - y(16)