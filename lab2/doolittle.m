function [L U] = crout(A)

	[n n] = size(A);
	L = eye(n);
	U = zeros(n);
	
	#	U(1, 1 : n) = A(1, 1 : n);
	#disp(U);
	for k = 1 : n
		for i = k : n
			% --------------------------------
			s = 0;
			for m = 1 : k-1
				s = s + L(k, m) * U(m, i);
			endfor
			% --------------------------------
			% echivalent pentru calculul sumei
			% s = L(i, 1 : k-1) * U(1 : k-1, k);
			U(k, i) = (A(k, i) - s);
		endfor
			
		for j = k + 1 : n
			% --------------------------------
			s = 0;
			for m = 1 : k-1
				s = s + L(j, m) * U(m, k);
			endfor
		    % ---------------------------------
			% echivalent pentru calculul sumei
			% s = L(k, 1 : k-1) * U(1 : k-1, j);
			L(j, k) = (A(j, k) - s) / U(k, k);
		endfor
	endfor
endfunction
