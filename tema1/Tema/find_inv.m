function[x] = find_inv(a, m) % folosesc mica teorema a lui fermat ca sa aflu inversul
	t = 1;
	for i = 1:m - 2
		t = mod(t * a, m);
	end
	x = t;

end