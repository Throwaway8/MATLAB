tau = [-1, -0.5, 0.5, 1];
x = linspace(-1,1,2814);
rho = [-0.7616, -0.4621, 0.4621, 0.7616];
p = baryeval1(tau, rho, x);
plot(x,y,tau,rho,'o');

title('Barycentric Interpolation');
xlabel('x boundary');
ylabel('y boundary');