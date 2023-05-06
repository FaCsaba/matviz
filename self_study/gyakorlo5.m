clear; hold on; axis equal;
syms x y z u v;
P1 = [0, 0, 0]; P2 = [0, 1, 1];
R1 = [1, 0, 1]; R2 = [1, 1, 0];

px(u) = (1 - u) * P1(1) + u * P2(1);
py(u) = (1 - u) * P1(2) + u * P2(2);
pz(u) = (1 - u) * P1(3) + u * P2(3);

fplot3(px, py, pz, [0, 1], 'r');

rx(u) = (1 - u) * R1(1) + u * R2(1);
ry(u) = (1 - u) * R1(2) + u * R2(2);
rz(u) = (1 - u) * R1(3) + u * R2(3);

fplot3(rx, ry, rz, [0, 1], 'r');

sx(u, v) = (1 - v) * px(u) + v * rx(u);
sy(u, v) = (1 - v) * py(u) + v * ry(u);
sz(u, v) = (1 - v) * pz(u) + v * rz(u);

fsurf(sx, sy, sz, [0 1, 0 1])

