clear
syms u v


k(u, v) = 2 + sin(7*u + 5*v);

x(u, v) = k(u,v) * cos(u) * sin(v);
y(u, v) = k(u,v) * sin(u) * sin(v);
z(u, v) = k(u,v) * cos(v);

fsurf(x,y,z, [0 2*pi, 0 pi]);
axis equal