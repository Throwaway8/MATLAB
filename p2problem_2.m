% Thomas Devries/ Jose/ Richard Gooding
% Integrating distance travelled vertically and horizontally of a
% projectile travelling student per time
% ---------------------------------------------------------------------------------------
load speed2018.mat
dx = zeros(size(t)); % vector to contain integrated horizontal distance values travelled
dy = zeros(size(t)); % vector to contain vertical distance values travelled
for i = 2:length(t)
    dx(i) = Vtrap(speedx(i), t(i)); % computing horizontal distance at time t
    dy(i) = Vtrap(speedy(i), t(i)); % computing vertical distance at time t
end
% plotting
figure
plot(t, dx, 'o', t, dy, 'o')
%xlabel('(time(seconds)')
%ylabel('magnitude of respective distance travelled')
title('Trajectory of Student blasted to UH')
%legend('x distance', 'y distance')
d = 605 - sum(dx);
disp(d) % approximate distance from univeristy hospital
disp(sum(dy))
