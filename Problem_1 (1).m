% Thomas Devries/Jose/Richard Gooding
% Showing that the trapezoid and composite trapezoid rule for numerical
% integration is bound by h2(b?a)K(1/12), h4(b ? a)Kc(1/720) aprroximate
% functions.
% ---------------------------------------------------------------------------------------------
n = floor(logspace(1, 5, 100));
a = 0; % lower bound of integral
b = 1; % upper bound of integral
f = @(x) atan(x);
df = @(x) 1/(1+x^2); % first derivative of arctan
d2f = @(x) -(2*x)/(1 + x^2)^2;% second derivative of arctan
d4f = @(x) -(24*x*(x^2 - 1))/(x^2 + 1)^4; % fourth derivative of arctan
K = abs(d2f(1/sqrt(3)));
Kc = abs(d4f(sqrt(1 - (2/sqrt(5)))));
exact = (pi - 2*log(2))/4; % exact value of integral arctan, x=0 -> x=1

ferr = zeros(1,length(n)); % forward error of trapezoid rule
errb = zeros(1,length(n)); % bounded error of trapezoid rule
for i = 1:length(n)
    h = (b - a)/n(i);
    t = Trap(f, a, b, n(i)); 
    ferr(i) = abs(exact - t);
    errb(i) = (1/12)*(h^2)*(b - a)*K;
end
figure %  plotting
loglog(n, ferr,'o', n, errb, 'k')
xlabel('n sub trapezoids')
ylabel('Bounded error/Forward error')
title('Proving Trapezoid Rule Error is Bound')
legend('forward error','bound error')

da = 1; % first derivative value at a
db = 1/2; % first derivative value at b
cferr = zeros(1, length(n-1)); % initialize empty vector to contain forward error values
cerrb = zeros(1, length(n-1)); % initialize empty vector to contain bounded error values
for i = 1:length(n-1) % begin loop
    h = (b - a)/n(i); % sub division of trapezoids to approximate area under the curve
    c = corrTrap(f, a, b, n(i), da, db); % corrected trapezoid rule value at each successive n value
    cferr(i) = abs(exact - c); % forward error for each successive n value
    cerrb(i) = (1/720)*(h^4)*(b - a)*Kc; % bounded error function
end
figure
loglog(n, cferr, 'o', n, cerrb, 'k')
legend('forward error', 'bounded error')
xlabel('n sub trapezoids')
ylabel('Bounded error/Forward error')
title('Proving Composite Trapezoid Rule Error is Bound')
legend('forward error','bound error')

