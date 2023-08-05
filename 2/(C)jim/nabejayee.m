function [x] = nabejayee(f,a,b,k)
format default
c = f(a);
d = f(b);
if c * d > 0
    error("same sign error!")
end
disp('    n          a          b       x       f(a)        f(x)')
i = 1;
while 1
    x = (a*f(b) - b*f(a))/(f(b)-f(a));
    disp([i    a     b        x    f(a)    f(x)])
    if abs(f(x)) < k
        break
    end
    if f(a)*f(x) > 0
        a = x;
    else
        b = x;
    end
    i = i + 1;
end
x = (a+b)/2;
e = (b-a)/2;
end



