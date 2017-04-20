function sol = rungekutta(val_init, n, xi, xf)

	u1 = 2/3;

	y(1) = val_init;

	h = (xf - xi) / n;
	x(1) = xi;
	
	y(2) = y(1) + h * u1 *fun(xi, y(1));
	for i = 1:n
		y(i + 1) = y(i) + h * fun(x(i), y(i));
		x(i + 1) = x(i) + u1 * h;
	end
	sol = y(n);
end