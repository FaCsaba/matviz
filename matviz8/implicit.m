clear
syms x y z
F(x,y,z)= x^2 + y^2 - z^2;
fimplicit3(F, [-5 5 -5 5 -5 0])
axis equal

F(2,3,4)