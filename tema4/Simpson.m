function I = Simpson(X, Y)

	n = length(X) + 1;


	 sum1 = 0;
	 sgn = -1;

	 for i = 3: 2 : n - 1 % merg din 2 in 2 pentru ca folosesc puncte stiute ca puncte intermediare, daca as merge din 1 in 1 as lua
	 	% unele regiuni de 2 ori

	 	if(X(i) < X(i - 1) && X(i - 1) > X(i - 2)) % nu are sens sa integrez cand punctele nu sunt consecutive, la fel si if-ul de mai jos
	 		continue;
	 	end

	 	if(X(i) > X(i - 1) && X(i - 1) < X(i - 2))
	 		continue;
	 	end

		if(X(i) < X(i - 1)) % daca am x descrescatori adun regiunea 
			sgn = 1;
		end

		if(X(i) > X(i - 1)) % cand x-ii scad (ne gandim la cazul de start, adica din cel mai de jos punct) trebuie sa scadem regiunea
			sgn = -1;
		end

		sum1 = sgn * (abs(X(i) - X(i - 2) )  * ( Y(i) + Y(i - 2) + 4 *  Y(i - 1) ) ) / 6 + sum1; 
		%X(i) - X(i - 2) reprezinta practic "grosimea" fasiei pe care calculam aria, restul e ca in formula

	 end
	 I = sum1;
	 printf("%.3f ", I);

end