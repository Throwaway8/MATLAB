% Richard/Thomas/Colin
% Solving the AIRY function on different intervals and comparing the
% solutions
%----------------------------------------------------------------------
f = @(t,y)[y(2); t*y(1)]; % linearized DE

y0 = airy(0); % initial condition
dy0 = -((3^(1/3))*gamma(1/3))^-1; % second initial condition

sol = ode45(f, [0, 10], [y0, dy0]'); % solution on t[0,10]
t = linspace(0, 10, 1000);
[y, dy] = deval(sol, t);

sol2 = ode45(f, [0, 2], [y0, dy0]'); % solution on t[0,2]
t2 = linspace(0,2,1000);
[y2, dy2] = deval(sol2, t2);
% plots comparing solutions

figure
subplot(1, 2, 1)
plot(t, y(1, :), t, airy(t))
title('AIRY eqn solution t[0, 10]')
xlabel('Time')
ylabel('Solution')
legend('ODE45 soln', 'exact soln')
subplot(1, 2, 2)
plot(t2, y2(1, :), t2, airy(t2))
title('AIRY eqn solution t[0, 2]')
xlabel('Time')
ylabel('Solution')
legend('ODE45 soln', 'exact soln')
% plots comparing residuals
figure
subplot(1, 2, 1)
plot(t2, abs(y2(1, :) - airy(t2)));
title('Residual [0, 2]')
xlabel('Time')
ylabel('Magnitude')
subplot(1, 2, 2)
plot(t, abs(y(1,:) - airy(t)));
title('Residual [0, 10]')
xlabel('Time')
ylabel('Magnitude')
