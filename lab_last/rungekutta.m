function sol = rungekutta(val_init, n, xi, xf)


	y(1) = val_init;
	h = (xf - xi) / n;
	x(1) = xi;
	
	for i = 1:n
		y(i + 1) = y(i) + h * fun(x(i), y(i));
		x(i + 1) = x(i) + h;
	end
	sol = y(n);
end