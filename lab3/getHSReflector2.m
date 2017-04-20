function [H] = getHSReflector2(x, p)
	
	s = 0;
	n = columns(x);
	for i = [1:columns(x)]
		 s = s + x(i) * x(i);

	s = realsqrt(s);
	sigma = s;

	y(1) = s;
	for i = [ 2; columns(x)]
		y(i) = 0 ;	
	end
	u = x - y;
	
	s2 = 0;
	for i = [1:columns(x)]
		s2 = s2 + u(i) * u(i);
	u = u / s2;
	H = eye(n) - 2 * u * u' / (u' * u);
			
endfunction
