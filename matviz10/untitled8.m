clear
syms u v
R = 2;
r = 1;
x(u,v) = (R+r*cos(v))*cos(u);
y(u,v) = (R+r*cos(v))*sin(u);
z(u,v) = r*sin(v);
fsurf(x,y,z,[0 2*pi 0 2*pi])
axis equal
