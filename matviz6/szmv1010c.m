clear 
syms x y
F(x,y) = x^2 + y^2 -1;
fimplicit(F, [0, 5], 'r')
axis equal
grid on
% P(0,1)
F(0,5)