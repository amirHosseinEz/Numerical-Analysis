import numpy as np
from matplotlib import pyplot as plt


v0_y = lambda y: y
v10_y = lambda y: 3*y
vx_0 = lambda x: 6
vx_8 = lambda x: 5*x + 2

x_lim = 10
y_lim = 8
k, h = 0.1, 0.1

points = []

y = []
c = 0
for i in range(int(y_lim/k)):
    y += [c]
    c += k

x = []
c = 0
for i in range(int(x_lim/h)):
    x += [c]
    c += h


n =(int(y_lim/k)-1)*(int(x_lim/h)-1)
to_Solve = np.zeros((n, n))
b = np.zeros(n)

solve_counter = 0

for i in range(1, int(y_lim/k)):
    for j in range(1, int(x_lim/h)):

        # solve_counter = current-equation-index

        to_Solve[solve_counter][(i-1)*(int(x_lim/h)-1) + j-1] = -4
        #                    [][current-node-index]
        t = 0

        if i-1 == 0:
            t += vx_0(x[j])
        else:
            #                    [][current-Lower_node-index]
            to_Solve[solve_counter][(i-2)*(int(x_lim/h)-1) + j-1] = 1

        if i + 1 == int(y_lim/k):
            t += vx_8(x[j])
        else:
            #                    [][current-Upper_node-index]
            to_Solve[solve_counter][i*(int(x_lim/h)-1) + j-1] = 1

        if j-1 == 0:
            t += v0_y(y[i])
        else:
            #                    [][current-Left_node-index]
            to_Solve[solve_counter][(i-1)*(int(x_lim/h)-1) + j-2] = 1

        if j + 1 == int(x_lim/k):
            t += v10_y(y[i])
        else:
            #                    [][current-Right_node-index]
            to_Solve[solve_counter][(i-1)*(int(x_lim/h)-1) + j] = 1

        b[solve_counter] = -t
        solve_counter += 1


z = np.linalg.solve(to_Solve, b)
for i in range(len(z)):
    print("x" + str(i+1) + " = " + str(z[i]))

# following lines are for make a list of tuples in form of (x, y, z)
points = []
z_counter = 0
for i in range(1,len(y)):
    for j in range(1,len(x)):
        points += [(x[j], y[i], z[z_counter])]
        z_counter += 1

# then we convert each index of tuples to a list, so we can draw the 3D plot
x1, y1, z1 = zip(*points)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(x1, y1, z1, c=z, cmap='viridis', linewidth=0.5)

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show()

