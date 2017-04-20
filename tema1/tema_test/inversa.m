	function [B] = inversa(A) % B = A ^ (-1)
		
	[n n] = size(A);

	if(n == 1) % inversa unei matrici de 1x1 e inversul unui nr
		B = 1/A;
		return ;
	end

	if(n == 2) %pentru matricile care nu contin zerouri nu e nevoie de cazul asta
		B = (1 / (A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1) ) ) * [A(2, 2) -A(1, 2); -A(2, 1) A(1, 1)];
		return ;
		%am facut ca in liceu(cu determinanti) inversa unei matrici de 2 x 2
	end
	k = 0;
	for i = 1:n - 1 % cautam un indice care sa ne imparta matricile in 4 matrici dintre care 
		%cea din stanga sus si dreapta jos sa fie nesingulare

		if(det( A(1:i, 1:i) ) && det( A(i + 1: n, i + 1: n)  ) )
			k = i;
			break;
		end
	end
	
	A1 = A(1:k, 1:k);
	A2 = A(k + 1: n, 1:k);
	A3 = A(1: k, k + 1:n);
	A4 = A(k + 1:n , k + 1:n);

	% A = [A1 A3]
	%     [A2 A4]
	B4 = inversa(A4);%A4 ^ -1
	B1 = inversa(A1);%A1 ^ -1

	F1 = inm_strassen(A3, B4);
	F2 = inm_strassen(F1, A2);
	%X1 = inversa(A1 - A3 * B4 * A2);
	X1 = inversa(A1 - F2);

	F1 = inm_strassen(B4 , A2);
	F2 = inm_strassen(F1, X1);
	%X2 = -B4 * A2 * X1;
	X2 = -F2;

	F1 = inm_strassen(A2, B1);
	F2 = inm_strassen(F1, A3);
	%X4 = inversa(A4 - A2 * B1 * A3);
	X4 = inversa(A4 - F2);

	F1 = inm_strassen(B1, A3);
	F2 = inm_strassen(F1, X4);
	%X3 = -B1 * A3 * X4; acelasi lucru fara inm_strassen
	X3 = -F2;

	B = [X1, X3; X2 ,X4]; %lipim matricile
	
end
