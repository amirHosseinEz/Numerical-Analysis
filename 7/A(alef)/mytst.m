clear
close
clc
format long
data = importdata('deta.txt');
x = data(:, 1);
y = data(:, 2);
x = x.';
y = y.';
z = simpson(x, y);
disp("integral value calculated by  simpson method is :")
disp([z])