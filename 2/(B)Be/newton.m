%newton's method
function x = newton(f, fPrime, x0, n)
digits(10);

x = x0;
disp('    n          x        f(x)      f(x)prime ')
for i = 1:n
    disp([i   x     f(x)       fPrime(x)])
    x = x - f(x) / fPrime(x);
end
end
