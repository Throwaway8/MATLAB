function C = corTrap(f, df, a, b, n)
h = (b - a)/n;
sum = (f(a) + f(b))/2;

for k = 1:n-1
    x = a + k*h;
    sum = sum + f(x);
end
C = h*sum + (df(b) - df(a))*h^2/12;
end

    
