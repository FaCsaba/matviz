clear; hold on; axis equal;
hermite_p_x = [-2, 4, 6, 10];
hermite_p_y = [-2, 0, -2, 2];
stops = [-1, 0, 2, 3];
range = [-1, 3];
syms a3 a2 a1 a0 t;

% plot(hermite_p_x, hermite_p_y, '*r');

cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
eq = [
    cx(stops(1)) == hermite_p_x(1), cx(stops(2)) == hermite_p_x(2), ...
    cx(stops(3)) == hermite_p_x(3), cx(stops(4)) == hermite_p_x(4)
];
m = solve(eq, [a3, a2, a1, a0]);
x(t) = subs(cx, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);

cy(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
eq = [
    cy(stops(1)) == hermite_p_y(1), cy(stops(2)) == hermite_p_y(2), ...
    cy(stops(3)) == hermite_p_y(3), cy(stops(4)) == hermite_p_y(4)
];
m = solve(eq, [a3, a2, a1, a0]);
y(t) = subs(cy, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);

fplot(x,y, range);

tx = 2;
plot(x(tx), )