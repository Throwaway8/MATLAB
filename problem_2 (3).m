% Richard Gooding/ Thomas Devries/ Jose Lopez
% forming Diffeential matrix D and tau node solutions p using
% LU rook pivot decomp to solve the levin/filon integration.
%--------------------------------------------------------------------
omega = 2018;
[D, p] = diffM(10);
A = D^2 + (omega^2)*eye(size(D));
b = omega*p;
%LU decomp to solve 
[L, U, P, Q] = luRook(A);
y = L\(P*b');
z = U\y;
g = Q*z;
f = (1/omega)*D*g;

% computing the integral
integralVal = f(1)*cos(omega) + g(1)*sin(omega) - f(end)*cos(omega) + g(end)*sin(omega) 
 % wolfram definite integral value: 0.000440957
q = integral(@(t)cos(2018*t).*(1 + t.^2).^-1,-1,1)
% values of intergral for number of nodes 1:10
m = [4.410694049416324e-04,4.408457650458233e-04,4.408904930249851e-04,4.409942802222749e-04,4.409763858779146e-04,4.409480010263624e-04,4.409528717997058e-04,4.409594712929120e-04,4.409583389940776e-04,4.409569284359209e-04];
x2 = [4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04,4.409573683743105e-04];
figure
plot(1:10, m, 1:10, x2)
title('Convergence of Integral Value to Exact Value')
xlabel('nodes')
ylabel('Integral Values')
legend('computed value','exact value')