clear
px = [ -2 0 4 5 ];
py = [ -2 3 6 -1 ];
plot(px, py, 'b*')
axis([ -4 8 -6 8 ]);
axis equal; hold on;
t0 = -1; t1 = 1; t2 = 2; t3 = 4;

syms a3 a2 a1 a0
eq = [  a3 * t0^3 + a2 * t0^2 + a1 * t0 + a0 == px(1), ...
        a3 * t1^3 + a2 * t1^2 + a1 * t1 + a0 == px(2), ...
        a3 * t2^3 + a2 * t2^2 + a1 * t2 + a0 == px(3), ...
        a3 * t3^3 + a2 * t3^2 + a1 * t3 + a0 == px(4)      ]
m = solve( eq, [a3, a2, a1, a0]);
syms t
x(t) = m.a3 * t^3 + m.a2 * t^2 + m.a1 * t + m.a0

syms b3 b2 b1 b0
eq = [  b3 * t0^3 + b2 * t0^2 + b1 * t0 + b0 == py(1), ...
        b3 * t1^3 + b2 * t1^2 + b1 * t1 + b0 == py(2), ...
        b3 * t2^3 + b2 * t2^2 + b1 * t2 + b0 == py(3), ...
        b3 * t3^3 + b2 * t3^2 + b1 * t3 + b0 == py(4)
        ];
m = solve( eq, [b3, b2, b1, b0]);
y(t) = m.b3 * t^3 + m.b2 * t^2 + m.b1 * t + m.b0

fplot(x, y, [t0, t3])