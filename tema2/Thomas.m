function X = Thomas(d, s, b)
	
	n = size(diag(d));
	
	%d diagonala, s supradiagonala, b coloana termenilor liberi

	for i = 1:n - 1
		a(i + 1) = s(i); %subdiagonala, ca sa aplicam mai usor formulele
	end

	for i = 1:n

		if(i == 1)
			c(i) = s(i) / d(i);	%elemntul supradiagonal
			b(i) = b(i) / d(i); %coloana termenilor liberi
			continue;
		end

		if(i != n)
			c(i) = s(i) / (d(i) - c(i - 1) * a(i)); %impartim la noul element de pe diagonala(bi - ci-1 * si)
			%elementele cupradigonale le retin in alt vector (c)
		end

		b(i) = (b(i) - b(i - 1) * a(i)) / (d(i) - c(i - 1) * a(i));

	end

	%aflu valorile necunoscutelor, foarte usor acum pentru ca am facut 0 pe diagonala inferioara
	X(n) = b(n);
	
	for i = n - 1:-1:1
		X(i) = b(i) - c(i) * X(i + 1);
	end


end