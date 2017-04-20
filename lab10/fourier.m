function[out]  = fourier(x, y, value)

	m = 6;

	s = 0;

	for k = 0:m

		s = 0;
		
		for i = 0: 2* m - 1
			s = s +  y(i + 1) * cos(k * x(i + 1));
		end
		
		A(k + 1) = s/m;
	end
	%A este decalat cu + 1

	s = 0;
	
	for k = 1:m - 1
		s = 0;
		for i = 0: 2* m - 1
			s = s +  y(i + 1) * sin(k * x(i + 1));
		end
		B(k) = s/m;
	end


	out = (A(1) + A(m + 1) * cos(m * value)) / 2;
	s = 0;

	for k = 0 : m - 1
		if(k == 0)
			s = A(k + 1) *  cos(k * value);
			continue;
		end
		s = s + A(k + 1) *  cos(k * value)  + B(k) * sin(k * value);
	end

	out = out + s;


end
