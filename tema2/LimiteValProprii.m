function [limita_inf, limita_sup] = LimiteValProprii(d, s) 
	%Intrari:
	% d = diagonala princiapal a matricei tridiagonale simterice
	% s = supradiagonala matricei tridiagonale simetrice
	%Iesiri: limitele radacinilor reale

	%Fiind simetrica de forma oarecare (fiind matrice tridiagonala simterice putem sa aplicam teorema Ghershgorin)
	[n n] = size(diag(d));
	limita_inf = 10^9;
	limita_sup = -10^9;
	
	for i = 1:n

		if(i == 1 || i == n)
			if(i == n) 
				t = abs(s(n - 1));
			else t = abs(s(1));
			end
		else 
			t = abs(s(i - 1)) + abs(s(i));
		end

		limita_sup = max(limita_sup, d(i) + t);
		limita_inf = min(limita_inf, d(i) - t);

	end

end