clear
bez0_p_x = [0, 2, 4, 6];
bez0_p_y = [1, 6, 6, 2];
hold on; axis equal;
bezier(bez0_p_x, bez0_p_y);

bez1_p_x = [bez0_p_x(4), bez0_p_x(4) + 3/4 * (bez0_p_x(4) - bez0_p_x(3)), 15, 18, 17];
bez1_p_y = [bez0_p_y(4), bez0_p_y(4) + 3/4 * (bez0_p_y(4) - bez0_p_y(3)), -4, 3, 5];
bezier(bez1_p_x, bez1_p_y);


function [x, y] = bezier(bezier_p_x, bezier_p_y)
    plot(bezier_p_x, bezier_p_y, '*--')
    n = numel(bezier_p_x) - 1;
    syms t
    bezier_x(t) = 0*t; bezier_y(t) = 0*t;
    for i=0:n
        b(t) = nchoosek(n, i)* t^i * (1-t)^(n-i);
        bezier_x(t) = bezier_x(t) + bezier_p_x(i+1) * b(t);
        bezier_y(t) = bezier_y(t) + bezier_p_y(i+1) * b(t);
    end
    fplot(bezier_x, bezier_y, [0, 1])
    x = bezier_x;
    y = bezier_y;
end