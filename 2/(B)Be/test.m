clear
close
clc
format default
x0 = 1;
f = @(x) x^3-((x^4+x^2+5)^(1/3));
fPrime = @(x) (3*x^2)-1/3*(4*x^3+2*x)*((x^4+x^2+5)^(-2/3));
n = 15;
x = newton(f, fPrime, x0, n);