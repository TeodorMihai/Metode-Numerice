function [x y] = CentroidOfSurface(X, Y)


	 surface = 0;
	 sgnY = 1;
	 sumX = 0;
	 sumY = 0;

	 n = length(X) + 1;

	 for i = 2:n - 1
	 	%sca / adun ca la trapeze, calculez tot o integrala
		
		if(X(i) < X(i - 1))
			sgn = 1;
		end

		if(X(i) > X(i - 1))
			sgn = -1;
		end

		if(Y(i) > Y(i - 1))
			sgnY = 1;
		end

		if(Y(i) < Y(i - 1))
			sgnY = -1;
		end


		surface = sgn * (abs( X(i) - X(i - 1) )  * ( Y(i) + Y(i - 1) )) / 2 + surface; % aria cu trapeze

		sumX = ( X(i) + X(i - 1) ) * sgn * (abs( X(i) - X(i - 1) )  * ( Y(i) + Y(i - 1) )) / 4  + sumX; % practic calculez integrala din f(x) * x dx
		%mai multe detalii in readme
		sumY = ( Y(i) + Y(i - 1) ) * sgnY * (abs( Y(i) - Y(i - 1) )  * ( X(i) + X(i - 1) )) / 4  + sumY; % intregala din y * f(y) dy


	 end


	 x = sumX / surface;
	 y = sumY / surface;
	 
end