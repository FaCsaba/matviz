clear; hold on; axis equal;

point_x = [-2, 6, 10];
point_y = [-2, -2, 2];
vec_x = 6;
vec_y = -4;

syms a3 a2 a1 a0 t;

cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
cxd(t) = diff(cx, t);
eq = [ 
    cxd(0) == vec_x, cx(0) == point_x(1);
    cx(1) == point_x(2), cx(1.5) == point_x(3)
];
m = solve(eq, [a3, a2, a1, a0]);
x(t) = subs(cx, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);

cy(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
cyd(t) = diff(cy, t);
eq = [ 
    cyd(0) == vec_y, cy(0) == point_y(1);
    cy(1) == point_y(2), cy(1.5) == point_y(3)
];
m = solve(eq, [a3, a2, a1, a0]);
y(t) = subs(cy, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);

plot(point_x, point_y, '*--')
fplot(x, y, [0, 1.5])
quiver(point_x(1), point_y(1), vec_x, vec_y);