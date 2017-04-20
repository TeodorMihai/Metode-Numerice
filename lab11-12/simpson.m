function aria = simpson(a, b, n)
	%x = 0;
	x = (b - a) / n;

	aria = 0;

	for i = 1:n - 1

		
		st = a;
		dr = a + x;
		mid = (st + dr )/ 2;
		%p(i) = a;
		%fun(st)
		h = dr - st;
		aria = aria + h *(fun(a) + 4 * fun(mid) + fun(b)) / 3;
		 
		a = a + x;

	end



end