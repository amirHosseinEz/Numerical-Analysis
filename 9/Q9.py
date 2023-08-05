import math
from matplotlib import pyplot as plt


time = []

higher_bound, lower_bound = 8, 2
n = 100
h = (higher_bound - lower_bound)/n

m = lower_bound
for j in range(n):
    time += [m]
    m += h

x1 = [1]
x2 = [1]

f_y = lambda t, i, k: x2[i] + k
f_y_ = lambda t, i, k: t**4 * math.log(t) + t**2 * (x1[i] + k) - 4*(x2[i] + k)

for j in range(1, len(time)):
    k1_y = h * f_y(time[j - 1], j-1, 0)
    k2_y = h * f_y(time[j - 1] + h/2, j-1, k1_y/2)
    k3_y = h * f_y(time[j - 1] + h/2, j-1, k2_y/2)
    k4_y = h * f_y(time[j - 1] + h, j-1, k3_y)
    x1 += [x1[j - 1] + (1/6)*(k1_y + 2*k2_y + 2*k3_y + k4_y)]

    k1_y_ = h * f_y_(time[j - 1], j-1, 0)
    k2_y_ = h * f_y_(time[j - 1] + h/2, j-1, k1_y_/2)
    k3_y_ = h * f_y_(time[j - 1] + h/2, j-1, k2_y_/2)
    k4_y_ = h * f_y_(time[j - 1] + h, j-1, k3_y_)
    x2 += [x2[j - 1] + (1/6)*(k1_y_ + 2*k2_y_ + 2*k3_y_ + k4_y_)]

print("x1:", x1)
plt.scatter(time, x1, label="x1", color="purple")
print("x2: ", x2)
plt.scatter(time, x2, label="x2")
plt.xlabel("time")
plt.ylabel("x")
plt.show()
