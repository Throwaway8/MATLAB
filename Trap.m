function t = Trap(f, a, b, n)
h = (b-a)/(n); % subdividing area under the function
sum = 0;
    for k = 1:n-1
        x = a + h*k;
        sum = sum + f(x); % summing up subdivisions
        
    end

t = h*((1/2)*f(a) + (1/2)*f(b) + sum); % computing trapezoid rule integration