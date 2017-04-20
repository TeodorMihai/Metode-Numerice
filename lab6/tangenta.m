function [sol] = tangenta(xi, eroare) % a < b
	xn = xi;

	while(abs(f(xi)) > eroare) 
		xn = xi  - f(xi) / f_derivat(xi);
		xi = xn;
	end

	sol = xn;

end