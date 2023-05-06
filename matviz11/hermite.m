clear
axis([ -4 8 -6 8 ]);
axis equal; hold on;

t1 = 0; t2 = 1;

px = [ -2 5 10]; py = [ -2 -1 2 ];
plot(px, py, 'b.')
vx = [ 12 3 0 ]; vy = [ 14 -4 5 ];
quiver(px(1), py(1), vx(1), vy(1));
quiver(px(2), py(2), vx(2), vy(2));

quiver(px(3), py(3), vx(3), vy(3)); % masodi hermithez

syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
cxd(t) = diff(cx, t);
eq = [ cx(t1) == px(1), cx(t2) == px(2), ...
    cxd(t1) == vx(1), cxd(t2) == vx(2)];
m = solve( eq, [ a3 a2 a1 a0]);
x(t) = subs(cx, [ a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0])

syms b3 b2 b1 b0
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
cyd(t) = diff(cy, t);
eq = [ cy(t1) == py(1), cy(t2) == py(2), ...
    cyd(t1) == vy(1), cyd(t2) == vy(2)];
m = solve( eq, [ b3 b2 b1 b0]);
y(t) = subs(cy, [ b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0])

fplot(x, y, [t1 t2], 'b')

% folytonosság: c^0/g^0 folytonos c(t1) = d(t2)
% c^1 folytonosság c^0 folytonos, c'(t1) = d'(t2)
% g^1 folytonosság g^0 teljes-l, c'(t1) / || c'(t1) || = d'(t2) / || d'(t2) ||

% masodik hermit
t3 = -1; t4 = 1;
eq = [ cx(t3) == px(2), cx(t4) == px(3), ...
    cxd(t3) == vx(2), cxd(t4) == vx(3)];
m = solve( eq, [ a3 a2 a1 a0]);
x(t) = subs(cx, [ a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0])

eq = [ cy(t3) == py(2), cy(t4) == py(3), ...
    cyd(t3) == vy(2), cyd(t4) == vy(3)];
m = solve( eq, [ b3 b2 b1 b0]);
y(t) = subs(cy, [ b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0])

fplot(x, y, [t3 t4], 'b')
