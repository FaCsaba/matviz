clear; hold on; axis equal;
syms x y z;

F(x, y, z) = sin(x) + cos(y) / x - z;
x_range = [0.1, 5]; y_range = [-6, 6];
fimplicit3(F, [0.1 5, -6, 6, -10, 10]);
F(x, y) = sin(x) + cos(y) / x;
fimplicit(F, [x_range, y_range], 'r', 'LineWidth', 4);
