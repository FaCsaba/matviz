clear
% approximate curve
% interpolates between two point's and approximates the other 2
% Beziér curve t goes from 0 to 1

% control poligon
% draws the control points together
% the curve is always inside the control poligon
% négy pontra harmad fokú ilyenkor n = 3

% there are two possible calculation

% Input: the control points
% [P(1,2), P(6,5), P(10,2), P(8, -1)]

px = [ 1 6 10 8 14 18 ];
py = [ 2 5 2 -1 5  0];
plot(px, py, '*--')

axis([-5 25 -4 8]); axis equal; hold on;
syms t
cx(t) = 0*t; cy(t) = 0*t;
n = 5;
for i=0:n
    b(t) = nchoosek(n, i)* t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i+1) * b(t);
    cy(t) = cy(t) + py(i+1) * b(t);
end
fplot(cx, cy, [0,1])

t0 = 1;
plot(cx(t0), cy(t0), '*')

dcx = diff(cx, t);
dcy = diff(cy, t);
%quiver(cx(t0), cy(t0), dcx(t0), dcy(t0))
% you can easily get the érintő even without derivált

c = [n * (px(n+1) - px(n)), n * (py(n+1) - py(n))];
quiver(px(n+1), py(n+1), c(1), c(2))



