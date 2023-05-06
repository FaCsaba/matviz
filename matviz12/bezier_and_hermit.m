
bezier_p_x = [0, 2, 4, 6, 5];
bezier_p_y = [1, -2, -2, 2, 4];
n = numel(bezier_p_x) - 1;

hermite_p_x = [bezier_p_x(numel(bezier_p_x)), 10];
hermite_p_y = [bezier_p_y(numel(bezier_p_y)), 6];

hold on;
plot(bezier_p_x, bezier_p_y, '*--')

syms t
bezier_x(t) = 0*t; bezier_y(t) = 0*t;
for i=0:n
    b(t) = nchoosek(n, i)* t^i * (1-t)^(n-i);
    bezier_x(t) = bezier_x(t) + bezier_p_x(i+1) * b(t);
    bezier_y(t) = bezier_y(t) + bezier_p_y(i+1) * b(t);
end
fplot(bezier_x, bezier_y, [0,1])

hermite_v_x = [n * (bezier_p_x(5) - bezier_p_x(4)), 2];
hermite_v_y = [n * (bezier_p_y(5) - bezier_p_y(4)), -4];
quiver(bezier_p_x(5), bezier_p_y(5), hermite_v_x(1), hermite_v_y(1))

range_start = 0; range_end = 2;
syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
cxd(t) = diff(cx, t);
eq = [ cx(range_start) == hermite_p_x(1), cx(range_end) == hermite_p_x(2), ...
    cxd(range_start) == hermite_v_x(1), cxd(range_end) == hermite_v_x(2)];
m = solve( eq, [ a3 a2 a1 a0]);
x(t) = subs(cx, [ a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

syms b3 b2 b1 b0
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
cyd(t) = diff(cy, t);
eq = [ cy(range_start) == hermite_p_y(1), cy(range_end) == hermite_p_y(2), ...
    cyd(range_start) == hermite_v_y(1), cyd(range_end) == hermite_v_y(2)];
m = solve( eq, [ b3 b2 b1 b0]);
y(t) = subs(cy, [ b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);

fplot(x, y, [range_start range_end], 'b')
quiver(x(range_end), y(range_end), hermite_v_x(2), hermite_v_y(2))