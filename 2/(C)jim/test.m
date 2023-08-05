clear
close
clc

format default
a = 1;
b = 2;
f = @(x) x^3 - (2^(x^(1/2)));
k = 0.001;
x = nabejayee(f,a, b, k);
