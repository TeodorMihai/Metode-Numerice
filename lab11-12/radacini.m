function v = radacini(n)

	nr_rad = 1
	rad_v = [-1 0 1];
	new_rad = rad_v;

	while(nr_rad < n)

		new_rad(1) = rad_v(1);
		for i = 2:nr_rad + 2;
			new_rad(i) = rad(rad_v(i - 1), rad_v(i), 0.0001, nr_rad + 1);

		end
		nr_rad++;
		new_rad(nr_rad + 2) = 1;

		rad_v = new_rad;
	end
	v = rad_v(2:nr_rad + 1);
	
end