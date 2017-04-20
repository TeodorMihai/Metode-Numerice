function vp = CalculezValProprii(d, s, m, eps)

	R = IntervaleValProprii(d, s, m);
	[n n] = size(diag(d));

	if(m > n)
		m = n;
	end

	for i = 1:m %pentru fiecare interval Ri - Ri + 1 calculez cu precizia eps val proprie, stim ca avem sigur o radacina
		%deci putem aplica bisectie fara alte verificari
		%pratic avem valoarea pe care o da polinomul caracteristic calculat cu functia ValoriPolinoame pentru valoarea lambda
		st = R(i);
		dr = R(i + 1);
		mid = (st + dr) / 2;
		P = ValoriPolinoame(d, s, mid);

		while( abs(P(n + 1)) > eps ) %cat timp ultima valoarea e la o distnta mai mare cu eps de origine	

			Pmid = ValoriPolinoame(d, s, mid);% Pmid(n + 1), valoarea polinomului pentru lambda = mid
			Pst = ValoriPolinoame(d, s, st); % val polinomului pentru lambda = st

			%ma duc fie in jumatatea superioara fie in cea inferioara (fie st-mid, fie mid-dr), in functie de locul unde se afla val proprie
			
			if(Pmid(n + 1) > 0) 
				if(Pst(n + 1) < 0) 
					dr = mid;
				else 
					st = mid;
				end
			end

			if(Pmid(n + 1) < 0)
				if(Pst(n + 1) < 0)
					st = mid;
				else 
					dr = mid;
				end
			end

			mid = (st + dr) / 2;
			P = ValoriPolinoame(d, s, mid);
		end

		vp(i) = mid;

	end
end