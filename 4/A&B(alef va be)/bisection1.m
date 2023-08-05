function [x e] = bisection(f,a,b,n)
c = f(a);
d = f(b);
if c * d > 0
    error("same sign error!")
end
for i = 1: n
    x = (a+b)/2;
    %disp([ a     b        x    (f(a)*f(x))/abs(f(a)*f(x))      f(x)])
    if f(x) == 0
        e = 0;
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