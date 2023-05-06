clear % we can clear workspace variables
c = 4;
d = 6;

x = [2, 5, 8, 10];
y = [3, 4, 3, 1];

plot(x, y, 'or-') % we plot points at x and y
% 'o' or '.' or '*' are markers .r = red dot
% -- szaggatott vonal
% - connects the dots
% r makes it red
axis([-2, 14, -1, 5])
axis equal
grid on
box off
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';