clear
close
clc
a = -7;
b = 6.5;
f = @(x) sin(31*x)-2*cos(23*x);
n = 2000;
[a b] = rootfinder(f,a, b, n);
numberofroots = size(a, 2);
out = sprintf('number of roots : %d',numberofroots);
disp(out);
ans = [];
for i = 1:numberofroots
    x = bisection1(f, a(1, i), b(1, i), 10);
    ans = [ans x];
end
disp(ans)
    

