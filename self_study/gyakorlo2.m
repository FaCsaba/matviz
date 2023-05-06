clear; hold on; axis equal;

syms x y z;
cz(x, y) = sqrt(1 - x^2 - 0.5 * y^2);
F(x, y, z) = cz(x, y) - z;
fimplicit3(F);

plot3(0.5, 0.2, cz(0.5, 0.2), '*r')