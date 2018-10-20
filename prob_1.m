f = @(x) atan(x);
df = @(x) 1/(1+x^2);
d4f = @(x) (24*x*(x^2-1))/(x^2+1)^4;
Kc = abs(d4f(sqrt(1 - 2/sqrt(5))));
a = 0;
b = 1;
n = floor(logspace(1,5,100));
exact = (pi - 2*log(2))/4;


ferrc = zeros(1,length(n));
berrc = zeros(1,length(n));
for i = 1:length(n)
    h = (b - a)/n(i);
    cT = corTrap(f, df, a, b, n(i));
    ferrc(i) = abs(exact - cT);
    berrc(i) = (1/720)*(h^4)*(b - a)*Kc;
end
figure
loglog(n, ferrc, n, berrc, 'ko')

    