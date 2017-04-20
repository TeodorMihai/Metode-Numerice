function  sol = rad(a ,b, eroare, n) % a < b
	mid = (a + b) / 2;

	while(abs(cebasev(n, mid)) > eroare) 

		%mid = b - f(b)(a - b) / (f(a) - f(b));
		mid = (a + b) / 2;
		if(cebasev(n, mid) > 0) 

			if(cebasev(n, a) < 0)
				b = mid; 
			else 
				a = mid;
			end
		elseif(cebasev(n, a) < 0)
			a = mid;
		else 
			b = mid;
		end

	end

	sol = mid;

end