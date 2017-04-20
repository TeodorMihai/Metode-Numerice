function I = Trapez(X, Y)


	 sum1 = 0;
	 sgn = -1;

	 n = length(X) + 1;

	 for i = 2:n - 1

	 	%trebuie sa vedem ce regiuni trebuie adunate si ce regiuni trebuie scazute
		if(X(i) < X(i - 1))
			sgn = 1;
		end

		if(X(i) > X(i - 1))
			sgn = -1;
		end

		sum1 = sgn * (abs(X(i) - X(i - 1) )  * ( Y(i) + Y(i - 1) )) / 2 + sum1; %aproximam, functia cu o dreapata, formula astfel rezulta 
		%din aria unui trapez


	 end
	 I = sum1;
	 printf("%.3f ", I);

end