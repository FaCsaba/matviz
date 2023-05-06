clear
syms u v
r = 2;
x(u,v) = r*cos(u)*sin(v);
y(u,v) = r*sin(u)*sin(v);
z(u,v) = r*cos(v);
fsurf(x,y,z,[0 2*pi 0 pi])
hold on
u0 = 3*pi/3;
v0 = 3;
plot3(x(u0,v0),y(u0,v0),z(u0,v0),'ro', 'MarkerSize', 10)
u1 = pi/5;
v1 = 5;
plot3(x(u1,v1),y(u1,v1),z(u1,v1),'ro', 'MarkerSize', 10)
upx(v) = x(u0,v);
upz(v) = y(u0,v);
upy(v) = z(u0,v);

hold off
axis equal