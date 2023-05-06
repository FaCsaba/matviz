clear; hold on; axis equal;

syms u v;
x(u, v) = u - u^3 / 3 + u * v^2;
y(u, v) = v - v^3 / 3 + v * u^2;
z(u, v) = u^2 - v^2;

u_range = [-25, 25]; v_range = [-25, 25];

fsurf(x, y, z, [u_range, v_range]);

u_specified = 10; v_specified = 15;
plot3(x(u_specified, v_specified), y(u_specified, v_specified), z(u_specified, v_specified), '*r', 'lineWidth', 5);


free_u_x(u) = x(u, v_specified);
free_u_y(u) = y(u, v_specified);
free_u_z(u) = z(u, v_specified);

free_v_x(v) = x(u_specified, v);
free_v_y(v) = y(u_specified, v);
free_v_z(v) = z(u_specified, v);
fplot3(free_u_x, free_u_y, free_u_z, u_range, 'r', 'LineWidth', 2);
fplot3(free_v_x, free_v_y, free_v_z, v_range, 'r', 'LineWidth', 2);
