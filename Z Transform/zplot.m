function zplot(b,a)


ymin = min([imag(roots(b)+eps*1i);imag(roots(a)+eps*1i);-1]);
ymax = max([imag(roots(b)+eps*1i);imag(roots(a)+eps*1i);1]);

xmin = min([real(roots(b)+eps*1i);real(roots(a)+eps*1i);-1]);
xmax = max([real(roots(b)+eps*1i);real(roots(a)+eps*1i);1]);


hold on
p = plot(roots(a)+eps*1i, 'X', 'MARKERSIZE', 7);
set(p, 'Color', 'blue');
z = plot(roots(b)+eps*1i, 'O', 'MARKERSIZE', 7);
set(z, 'Color', 'red');

grid on
axis equal;

angle=0:2*pi/1000:2*pi;
x = cos(angle) + 1i*sin(angle);
u = plot(x, '--');
xlim([1.2*xmin 1.2*xmax]);
ylim([1.2*ymin 1.2*ymax]);
set(u, 'Color', 'green');


end

