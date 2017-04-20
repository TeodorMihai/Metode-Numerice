function aria = trapez(a, b, n)
	%x = 0;
	x = (b - a) / n;

	aria = 0;
	for i = 1:n - 1
		
		st = a;
		dr = a + x;
		%p(i) = a;
		h = dr - st;
		aria = aria + ( (fun(st) + fun(dr)) * h ) / 2;
		a = a + x;

	end



end


