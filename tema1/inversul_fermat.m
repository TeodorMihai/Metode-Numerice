function[y] = inversul_fermat(x) 

	t = 1;
	for i = 1:27
		t = mod(t * x, 29);
	end

	y = t;
end