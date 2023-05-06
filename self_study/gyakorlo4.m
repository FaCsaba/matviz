clear; hold on; axis equal;
syms x y z;

F(x, y, z) = x + y - z;
Q(x, y, z) = x - 2 * y + 3 * z - 4;
R(x, y, z) = 2 * x - 0.5 * y + 4 * z - 2;

fimplicit3(F, 'r');
fimplicit3(Q, 'g');
fimplicit3(R, 'b');