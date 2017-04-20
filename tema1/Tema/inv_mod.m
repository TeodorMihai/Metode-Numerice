function [B] = inv_mod (A, p)

	[n n] = size(A);
	A = [A, eye(n)];
	for i = 1:n
		[x] = find_inv(A(i, i), p); % Aflu inversul mod p
		
		for j = 1:2 * n
			A(i, j) = mod(A(i, j) * x, p); % inmultesc linia cu inversul gasit(ca sa am 1 pe pozitia A(i, i))
		end
		B = A; % am nevoie de unele valori dupa ce le sciru, am nevoie de o matrice auxiliara
		for j = 1:n
			if(j != i) % linia i ramane nemodificata
				for k = i :2 * n 
					B(j, k) = A(j, k) - mod(A(i, k) * A(j, i), p); % fac mod inainte sa scad pentru ca daca imi da un nr negativ
																	% foarte mar in val absoluta sa nu ma chinui sa il fac pozitiv prea mult
					if(B(j, k) < 0) 
						B(j, k) = B(j, k) + p;
					end
				end
			end
		end


		A = B;
	end
	B = A(:, n + 1: n + n); % selectez inversa
end
