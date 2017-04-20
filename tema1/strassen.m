function strassen(in, out)
	H = dlmread(in);
	n = H(1,1);

	[sz sz1] = size(H);
	A = H(2 : sz, 1 : sz1);

	-- sz;
	s = 1;
	if sz < 32
		s = 0;
	endif
	
	A = iinv(A, s);
	X = A;

	i = 1;
	while i < n
		X = mult(X, A, s);
		++ i;
	endwhile

	dlmwrite(out, X, ' ');
endfunction

function X = mult(A, B, s)
	[n1 n2] = size(A);
	[m1 m2] = size(B);

	if A == zeros(n1, n2) || B == zeros(m1, m2)
		X = zeros(n1, m2);
	elseif max(max(n1, n2), max(m1, m2)) <= 1
		X = A * B;
	elseif max(max(n1, n2), max(m1, m2)) <= 32 && s == 1
		X = A * B;
	else
		p = 2 ^ nextpow2(max(max(n1,n2),max(m1,m2)));
		if min(n1, n2) != p
			H = zeros(p);
			H(1 : n1, 1 : n2) = A;
			A = H;
		end 
		if min(m1, m2) != p
			H = zeros(p);		
			H(1 : m1, 1 : m2) = B;
			B = H;
		end
		A11 = A(1 : p / 2, 1 : p / 2);
		A12 = A(1 : p / 2, p / 2 + 1 : p);
		A21 = A(p / 2 + 1 : p, 1 : p / 2);
		A22 = A(p / 2 + 1 : p, p / 2 + 1 : p);

		B11 = B(1 : p / 2, 1 : p / 2);
		B12 = B(1 : p / 2,  p / 2 + 1 : p);
		B21 = B(p / 2 + 1 : p, 1 : p / 2);
		B22 = B(p / 2 + 1 : p, p / 2 + 1 : p);

		P1 = mult(A11, B12 - B22, s);
		P2 = mult(A11 + A12, B22, s);
		P3 = mult(A21 + A22, B11, s);
		P4 = mult(A22, B21 - B11, s);
		P5 = mult(A11 + A22, B11 + B22, s);
		P6 = mult(A12 - A22, B21 + B22, s);
		P7 = mult(A11 - A21, B11 + B12, s);

		C11 = (P5 + P4 - P2 + P6);
		C12 = (P1 + P2);
		C21 = (P3 + P4);
		C22 = (P1 + P5 - P3 - P7);
		
		X = [C11 C12; C21 C22];
		X = X(1 : n1, 1 : m2);
	endif

endfunction


function X = iinv(A, s)
	[n n] = size(A);

	if n <= 1
		X = 1 / A;
	elseif n <= 32 && s == 1
		X = gauss_jordan(A);
	else
		i = floor(n / 2);
		A11 = A(1 : i, 1 : i);
		A12 = A(1 : i, i + 1 : n);
		A21 = A(i + 1 : n, 1 : i);
		A22 = A(i + 1 : n, i + 1 : n);

		A11i = iinv(A11, s);
		A22i = iinv(A22, s);

		X11 = iinv(A11 - mult(mult(A12, A22i, s), A21, s), s);
		X22 = iinv(A22 - mult(mult(A21, A11i, s), A12, s), s);
		X21 = -mult(mult(A22i, A21, s), X11, s);
		X12 = -mult(mult(A11i, A12, s), X22, s);

		X =[X11 X12; X21 X22];
	endif

endfunction

function [X, A] = gauss_jordan(A)
	[n n] = size(A);
	X = eye(n);

	for i = 1 : n
		for j = 1 : i - 1
				X(j, 1 : n) -= X(i, 1 : n) * A(j, i) / A(i, i);
				A(j, 1 : n) -= A(i, 1 : n) * A(j, i) / A(i, i);
		endfor
		for j = i + 1 : n
				X(j, 1 : n) -= X(i, 1 : n) * A(j, i) / A(i, i);
				A(j, 1 : n) -= A(i, 1 : n) * A(j, i) / A(i, i);
		endfor
		X(i, 1 : n) /= A(i, i);
		A(i, 1 : n) /= A(i, i);
		
	endfor
endfunction

