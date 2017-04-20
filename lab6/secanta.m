function [sol] = bisectie(a ,b, eroare) % a < b
	mid = (a + b) / 2;

	while(abs(f(mid)) > eroare) 

		mid = b - f(b) * (a - b) / (f(a) - f(b));
		%mid = (a + b) / 2;
		if(f(mid) > 0) 

			if(f(a) < 0)
				b = mid; 
			else 
				a = mid;
			end
		elseif(f(a) < 0)
			a = mid;
		else 
			b = mid;
		end

	end

	sol = mid;

end