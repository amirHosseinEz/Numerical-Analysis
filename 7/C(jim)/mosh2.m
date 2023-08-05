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
prime2 = [];
for i= 5 : 991
    a = (y(1, i + 1) - (2 * y(1, i)) + y(1, i - 1))/(h^2);
    prime2 = [prime2 a];
end
x2 = x(5: 991);
plot(x2, prime2);
prime2