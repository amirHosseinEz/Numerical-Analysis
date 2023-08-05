function [x] = bisection(f,a,b,k)
c = f(a);
d = f(b);
if c * d > 0
    error("same sign error!")
end
disp('    n          x          f(x)')
n = 0;
while 1
    n = n + 1;
    x = (a+b)/2;
    disp([n x f(x)])
    if abs(f(x)) < k
        break
    end
    if f(a)*f(x) > 0
        a = x;
    else
        b = x;
    end
end 
x = (a+b)/2;
e = (b-a)/2;
end