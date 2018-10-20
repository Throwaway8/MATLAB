% Thomas/Richard/Colin
% Solving the damped duffing oscillation equation with matlab ode solver
%-------------------------------------------------------------------
% weights of the oscillation equation
beta = 4;
alpha = 1;
k = 8;
omega = .5;
delta = .02;
% linearized DE
f = @(t, x)[x(2); k*cos(omega*t) - delta*x(2) - alpha*x(1) - beta*x(1).^3];
% getting solution to the duffing equation
sol = ode23(f, [0, 50], [1, 1]');
t = linspace(0, 50, 1000);
[y, dy] = deval(sol, t);
% initializing vector to contain the residuals
residual = zeros(size(y));
% coputing residuals
for k = 1:length(y)
    residual(:,k) = y(:,k) - f(t(k), y(:,k));
end
% plotting solutions
figure
subplot(2, 1, 1)
plot(t, y)
title('Solutions for Initial Conditions dy(0) and y(0)')
xlabel('Time')
ylabel('Solution Values')
subplot(2, 1, 2)
semilogy(t, abs(residual))
title('Residual Values')
xlabel('Time')
ylabel('Magnitude')
% plotting residuals 
figure
plot(t,y(1,:))
title('Solution for Initial Condition y(0)')
xlabel('Time')
ylabel('Solution Values')