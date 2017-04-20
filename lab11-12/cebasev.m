function value = cebasev(n, x) 

	if(n  == 0)
		value = 1;
		return ;
	end

	if(n == 1)
		value = x;
		return ;
	end

	value = 2 * x * cebasev(n - 1, x) - cebasev(n - 2, x);
end