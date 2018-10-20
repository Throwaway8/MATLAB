% Thomas/Richard/Colin
% Solving a differential system using ode45 and ode15s and looking for
% stifness
% ---------------------------------------------------------------------
% creating matrix
n = 5;
A = diag(ones(1, n-1), -1) + diag(-4*ones(1, n)) + diag(ones(1, n-1), 1);
% obtaining our initial value
y0 = zeros(n, 1);
y0(end) = 1;
T = 100; % time interval size
f = @(t,y) A*y; % DE
% computing the solution with ode45
sol = ode45(f, [0, T], y0);
t = linspace(0, T, 1000);
[y45, yp] = deval(sol, t);

[~, m] = size(y45);
residual = zeros(size(y45));
% computing the residuals
for k = 1:m 
residual(:,k) = y45(:,k) - f((t(k)), yp(:,k));
end
% computing the solution with ode15s
sol = ode15s(f, [0, T], y0);
s = linspace(0, T, 1000);
[y15, yd] = deval(sol, s);
% computing resduals
[~,l] = size(y15);
residual2 = zeros(size(y15));
for k = 1:l
residual2(:,k) = y15(:,k) - f((s(k)), yd(:,k));
end
% plotting solutions
figure
subplot(2, 1, 1)
semilogy(t, y45)
title('ODE45')
xlabel('Time')
ylabel('Solution')
subplot(2, 1, 2)
semilogy(t, y15)
title('ODE15s')
xlabel('Time')
ylabel('Solution')
% plotting residuals
figure
subplot(1, 2, 1)
semilogy(t, abs(residual))
title('Residual for 45')
xlabel('Time')
ylabel('Magnitude')
subplot(1, 2, 2)
semilogy(s, abs(residual2))
title('Residuals for 15s')
xlabel('Time')
ylabel('Magnitude')

