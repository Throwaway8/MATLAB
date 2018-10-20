f = @(x) x.^2 - 2;
df = @(x) 2*x;

x3 = newtonsMethod(f, df, 1.5, 1e-10, 20);

x4 = bisectionMethod(f, 1.3, 1.5, 1e-10, 20);

berrNewton = abs(f(x3));

berrBisection = abs(f(x4));

semilogy(0:length(berrNewton)-1, berrNewton, 1:length(berrBisection), berrBisection)