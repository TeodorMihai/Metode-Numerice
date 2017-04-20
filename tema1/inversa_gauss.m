function[B] = inversa_gauss(A) % gauss-jordan in operatii modulo 29

	[n n] = size(A);

	A = [A  eye(n)];
	C = A;
	for i = 1:n
		a = inversul_fermat(A(i, i)); % gasasesc inversul pivotului ca sa il fac 1 si apoi sa fac zerouri mult mai usor
		%A(i, i)
		A(i, :) = A(i, : ) * a; % inmultesc linia cu inversul
		A = mod(A, 29);
		C = A;
		for k = 1:n
			if(k != i)
				C(k,: ) = A(k,: );
				C(k,:) = C(k,:) -A(i, :)* A(k,i); % fac zerouri deasupra si sub linia pivotului, modificand si celelalate valori de pe linii
			endif
		endfor
		
		C = mod(C,29);

		for k1 = 1:n
			for k2 = 1:2*n
				while(C(k1,k2) < 0)
					C(k1, k2) = C(k1, k2) + 29; % ca sa am valori doar in intervalul 0..29
				end
			endfor
		endfor
	A = C;
	endfor
	B = A(:, (n + 1: 2 * n )); % iau doar inversa
endfunction