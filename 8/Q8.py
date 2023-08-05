
from matplotlib import pyplot as plt


time = []
h = 0.01
higher_bound, lower_bound = 7, 0
n = int((higher_bound - lower_bound)/h)

m = 0
for j in range(n):
    time += [m]
    m += h

R1, R2, R3, R4, R5 = 2, 5, 2, 3, 2
R = R5 + (R3*R4 / (R3 + R4))

C1, C2 = 50, 100
L1, L2 = 50, 10
es = 20

f_iL1 = lambda i, k: (-(R1 + R) / L1) * (x1[i] + k) - (R / L1) * (x2[i] + k) - ((x3[i] + k) + (x4[i] + k)) / L1 + R4 / (L1 * (R3 + R4)) * es
f_iL2 = lambda i, k: (-R / L2) * (x1[i] + k) - ((R2 + R) / L1) * (x2[i] + k) - (x4[i] + k) / L2 + R4 / (L1 * (R3 + R4)) * es
f_vC1 = lambda i, k: (x1[i] + k)/C1
f_vC2 = lambda i, k: (x1[i] + k)/C2 + (x2[i] + k)/C2


x1 = [0]
x2 = [0]
x3 = [0]
x4 = [0]

for t in range(1, len(time)):
    k1_1 = h * f_iL1(t - 1, 0)
    k1_2 = h * f_iL1(t - 1, k1_1)
    x1 += [x1[t-1] + 0.5*(k1_2 + k1_1)]

    k2_1 = h * f_iL2(t - 1, 0)
    k2_2 = h * f_iL2(t - 1, k2_1)
    x2 += [x2[t - 1] + 0.5 * (k2_2 + k2_1)]

    k3_1 = h * f_vC1(t - 1, 0)
    k3_2 = h * f_vC1(t - 1, k3_1)
    x3 += [x3[t - 1] + 0.5 * (k3_2 + k3_1)]

    k4_1 = h * f_vC2(t - 1, 0)
    k4_2 = h * f_vC2(t - 1, k4_1)
    x4 += [x4[t - 1] + 0.5 * (k4_2 + k4_1)]


plt.scatter(time, x1, label="iL1", color="blue")
plt.scatter(time, x2, label="iL2", color="orange")
plt.xlabel("time")
plt.ylabel("iL")
print("x1:", x1)
print("x2:", x2)
plt.show()

plt.scatter(time, x3, color="yellow")
plt.scatter(time, x4, color="green")
plt.xlabel("time")
plt.ylabel("Vc")
print("x3:", x3)
print("x4:", x4)
plt.show()
