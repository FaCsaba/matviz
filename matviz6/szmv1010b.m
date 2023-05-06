clear

syms x
f(x) = sin(x);
% doesn't make the other plot go away
fplot(f, [-6, 2], 'g', 'LineWidth', 3);
axis equal
grid on
axis([-10, 6, -2, 2])
hold on

% P = (1, f(1))
plot(1.70, f(1.70), '.r', 'MarkerSize', 15) % snake-y snake