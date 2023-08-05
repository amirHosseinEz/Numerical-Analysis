clear
close
clc
format default
a = 0;
b = 1;
f = @(x) x^3 + 4*x^2 - 2;
fPrime = @(x) 3*x^2 +8*x;
k = 0.004;
x = bisection(f,a, b, k);
