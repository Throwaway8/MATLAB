

% Setting the boundaries of x
x = linspace(-2*pi,2*pi,2018);
% initialize the function class sin(x)
T = sin(x);
% Taylor series expansion at 0 from 0-1
T1 = sinTaylorseries(x,1);
% Taylor series expansion at 0 from 0-2
T2 = sinTaylorseries(x,2);
% Taylor series expansion at 0-10
T10 = sinTaylorseries(x,10);
% Graph variables
plot(x, T, x, T1, x, T2, x, T10);

title('Taylor Series Expansion of Sin(x)'); 

xlabel('-2pi<x<2pi'); %x axis label
ylabel('Values') %y axis label 

% Label seperate curves induvidulally
legend('T','T1', 'T2', 'T10');
