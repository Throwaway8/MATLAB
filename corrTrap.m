function T = corrTrap(f, a, b, n, da, db)
format long
h = (b - a)./n;
aF = 1/2*f(a);
bF = 1/2*f(b);
term = ((h^2)/12)*(da - db);
p = zeros(1,length(n-1));
for k = 1:n-1
    x = (a + k*h);
    p = p + f(x);
end
T = h*(aF + p + bF) + term;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
