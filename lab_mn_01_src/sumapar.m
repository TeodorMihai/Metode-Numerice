function [ s ] = sumapar(n)
	s = 0;
	for x = [0 : 2 : n] 
		s = s + x;
	endfor
disp(s);
endfunction
