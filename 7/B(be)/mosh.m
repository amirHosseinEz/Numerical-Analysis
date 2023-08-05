clear
close
clc
format long
data = importdata('deta.txt');
x = data(:, 1);
y = data(:, 2);
n = size(x, 1);
x = x.';
y = y.';
h = (x(1,n) - x(1,1))/(n - 1);
prime = [];
for i= 2 : n-1
    a = (y(1, i + 1) - y(1, i - 1))/(2*h);
    prime = [prime a];
end
x2 = x(2:n - 1);
plot(x2, prime);
prime