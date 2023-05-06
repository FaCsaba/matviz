clear
axis([ -4 8 -6 8 ]);
axis equal; hold on;
t1 = 0; t2 = 1;
px = [ -2 5 ]; py = [ -2 -1 ];
plot(px, py, 'b.')
vx = [ 12 3 ]; vy = [ 14 -4 ];
quiver(px(1), py(1), vx(1), vy(1));
quiver(px(2), py(2), vx(2), vy(2));

syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
cxd(t) = diff(cx, t);
eq = [ cx(t1) == px(1), cx(t2) == px(2), ...
    cxd(t1) == vx(1), cxd(t2) == vx(2)];
m = solve( eq, [ a3 a2 a1 a0]);
x(t) = subs(cx, [ a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

syms b3 b2 b1 b0
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
cyd(t) = diff(cy, t);
eq = [ cy(t1) == py(1), cy(t2) == py(2), ...
    cyd(t1) == vy(1), cyd(t2) == vy(2)];
m = solve( eq, [ b3 b2 b1 b0]);
y(t) = subs(cy, [ b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);

fplot(x, y, [t1 t2], 'b')
