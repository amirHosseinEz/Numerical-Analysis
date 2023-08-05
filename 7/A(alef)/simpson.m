function [I] = simpson(x,y)
n = size(x, 2);
high = y(1, n);
low = y(1, 1);
h = (x(1,n) - x(1,1))/(n - 1);

X = high+low;

Odd = 0;
Even = 0;
for i = 2:2:n-1
    Odd=Odd+y(1, i);
end
for i = 3:2:n-1
    Even=Even+y(1, i);
end
  
I = (h/3)*(X+4*Odd+2*Even);