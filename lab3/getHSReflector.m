function [vp, sigma, beta] = getHSReflector(x, p)
	s = 0;
	for i = [p:columns(x)]
		 s = s + x(i) * x(i);

	s = realsqrt(s);
	s = s * sign(x(p));
	sigma = s;

	vp(p) = x(p) + s;

	for i = [p + 1:columns(x)]
		vp(i) = x(i);
	endfor
	
	for i = [ 1 : p - 1] 
		vp(i) = 0;
	endfor
	beta = vp(p) * sigma; 		
endfunction
