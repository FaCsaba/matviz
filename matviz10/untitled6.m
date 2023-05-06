clear
syms u v
r = 1;
hx(u,v) = r*cos(u);
hy(u,v) = r*sin(u);
hz(u,v) = v;
fsurf(hx,hy,hz,[0 2*pi 0 4])
axis equal
hold on
u0 = 2*pi / 3;
v0 = 1.5;
plot3(hx(u0,v0),hy(u0,v0),hz(u0,v0),'ro', 'Markersize',10)
u1 = pi/3;
v1 = 2;
P = [hx(u1,v1),hy(u1,v1),hz(u1,v1)];
plot3(P(1),P(2),P(3),'ro','MarkerSize',10)
upx(v) = hx(u0,v);
upy(v) = hy(u0,v);
upz(v) = hz(u0,v);
fplot3(upx,upy,upz,[0 4],'r','LineWidth',4)
vpx(u) = hx(u,v0);
vpy(u) = hy(u,v0);
vpz(u) = hz(u,v0);
fplot3(vpx,vpy,vpz, [0 4],'r','LineWidth',4)
vpxd(u) = diff(vpx,u);
vpyd(u) = diff(vpy,u);
vpzd(u) = diff(vpz,u);
vec = [vpxd(u0),vpyd(u0),vpzd(u0)];
quiver3(hx(u0,v0),hy(u0,v0),hz(u0,v0),vec(1),vec(2),vec(3),'r','LineWidth',4)
upxd(v) = diff(upx,v);
upyd(v) = diff(upy,v);
upzd(v) = diff(upz,v);
vec2=[upxd(v0),upyd(v0),upzd(v0)];
quiver3(hx(u0,v0),hy(u0,v0),hz(u0,v0),vec2(1),vec2(2),vec2(3),'b','LineWidth', 4)
hold off

