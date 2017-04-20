function V = inmultire(d, s, X)

	[n n]= size(diag(d));
	m = columns(X);


	if(m == 1) %in caz ca e vector coloana 
		X = X';
	end
	
	V(1) = d(1) * X(1) + s(1) * X(2); 
	
	for i = 2:n - 1 
		V(i) = s(i - 1) * X(i - 1) + d(i) * X(i) + s(i) * X(i + 1); %practic inmultesc linia cu coloana, doar 3 elemente de pe fiecare linie nu sunt 0
		
	end
	V(n) = s(n - 1) * X(n - 1) + X(n) * d(n);
end