% Interpolating given data using the second form of the Barycentric
% polynomial. 

tau = [1.725, 1.035, 0.975, 0.405, 0.015, -0.015, -0.405, -0.975, -1.035, -1.725];
x = linspace(-1.75,1.75,1001);
rho = [73.439, -86.510, -90.472, -138.670, -154.987, -154.987, -138.670, -90.472, -86.510, 73.439];
p = baryeval2(tau, rho, x);
plot(x,p,tau,rho,'o');

title('Barycentric second form Interpolation');
xlabel('x boundary');
ylabel('y boundary');

f = @(x) baryeval2(tau, rho, x);
% Fzero built in matlab root finding method.
rootfz = fzero(f, 1)
% Finding a root with bisection method
root2 = bisectionMethod(f, -2, 2, 1e-7, 20);
rootBi = root2(end)
% Using tau nodes as bounds initial bounds for bisection root finding
% method.
rootTk = bisectionMethod(f, -0.975, 0.975, 1e-1, 20)