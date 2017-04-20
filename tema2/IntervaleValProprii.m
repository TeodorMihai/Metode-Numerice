function R = IntervaleValProprii(d, s, m)

	[lim_inf, lim_sup] = LimiteValProprii(d, s);
	[n n] = size(diag(d));
	if(m > n) %nu pot fi mai multe radacini decat gradul polinomului(dimensiunea matricei)
		m = n;
	end;

	R(1) = lim_inf;
	R(m + 2) = lim_sup;
	
	for i = m : -1 : 1
		
		mid = (R(i + 2) + R(1)) / 2;
		h =  R(i + 2) - mid;
		numvp = NrValProprii(d, s, mid);

		while(numvp != i)

			numvp = NrValProprii(d, s, mid);
						
			
			h  = h/2;
			if(numvp < i)
				mid = mid + h;
			elseif(numvp > i)
				mid = mid - h;
			end

			if(h < 0.00001) 
				break;
			 end;

		end

		R(i + 1) = mid;
	end
	
	R = R(1:m + 1);
end