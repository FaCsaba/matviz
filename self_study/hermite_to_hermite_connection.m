clear; hold on; axis equal;

h1_p_x = [1 2];
h1_p_y = [3, 4];
h1_v_x = [5, 6];
h1_v_y = [7, 8];

h2_p_x = [h1_p_x(2), 9];
h2_p_y = [h1_p_y(2), 10];

h2_v_x = [h1_v_x(2), 11];
h2_v_y = [h1_v_y(2), 12];

hermite(h1_p_x, h1_p_y, h1_v_x, h1_v_y)
hermite(h2_p_x, h2_p_y, h2_v_x, h2_v_y)












function hermite(hermite_p_x, hermite_p_y, hermite_v_x, hermite_v_y)
    range_start = 0; range_end = 1;
    plot(hermite_p_x, hermite_p_y, '*b');
    quiver(hermite_p_x(1), hermite_p_y(1), hermite_v_x(1), hermite_v_y(1));
    quiver(hermite_p_x(2), hermite_p_y(2), hermite_v_x(2), hermite_v_y(2));
    
    syms a3 a2 a1 a0 t
    
    cx(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
    cxd(t) = diff(cx, t);
    eq = [
        cx(range_start) == hermite_p_x(1), cx(range_end) == hermite_p_x(2), ...
        cxd(range_start) == hermite_v_x(1), cxd(range_end) == hermite_v_x(2)
    ];
    m = solve(eq, [a3, a2, a1, a0]);
    x(t) = subs(cx, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);
    
    
    cy(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
    cyd(t) = diff(cy, t);
    eq = [
        cy(range_start) == hermite_p_y(1), cy(range_end) == hermite_p_y(2), ...
        cyd(range_start) == hermite_v_y(1), cyd(range_end) == hermite_v_y(2)
    ];
    m = solve(eq, [a3, a2, a1, a0]);
    y(t) = subs(cy, [a3, a2, a1, a0], [m.a3, m.a2, m.a1, m.a0]);
    
    fplot(x, y, [range_start, range_end], 'b');
end