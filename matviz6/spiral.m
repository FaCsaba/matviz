clear
syms t
x(t) = t*cos(t);
y(t) = t*sin(t);
fplot(x(t), y(t), [0, 12*pi])
axis equal

hold on

% P=(8pi, f(8pi))
a = 8 * pi;
plot(x(a), y(a), ... kiértékeljük a-ra
    '.r', ... dot with the color red
    'MarkerSize',15 ... change the marker size to be 15
    )

xd(t) = diff(x, t); % deriválás
yd(t) = diff(y, t);



quiver(x(a),y(a), xd(a), yd(a)) % Drawing a vector starter point, end point
