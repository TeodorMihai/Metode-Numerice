function [] = F2() 
	%Neville
	input_file1 = fopen("barcelona.txt", "r");

	m = fscanf(input_file1, "%d", 1);
	n = fscanf(input_file1, "%d", 1);
	m
	
	for i = 1:n + 1
		tline = fgets(input_file1); 
		A = str2num(tline); % transform in numere

		if(i == 1) % prima linie nu o sa contina nimic (linai cu m si n)
			continue;
		end
		
		[t k] = size(A); 
		k = k / 2; % am k puncte si 2  * k numere pe fiecare linie
		X = linspace(A(1), A(k), m); % iau punctele echidistante pe interval
		for j = k + 1 : 2 * k
			P(j - k) = A(j); % y (i)
		end


		for j = 1:m % pentru fiecare punct calculez valoarea

			%in punctul A(j)
			%X(1) = 3;
			ok = 0;
			for i = 1:k - 1
				if(X(j) >= A(i) && X(j) <=  A(i + 1)) 
					final_value(j) = P(i) +  ((P(i + 1) - P(i) ) / (A(i + 1) - A(i)) ) * (X(j) - A(i));
					ok = 1;
					%practic pentru aproximez cu derivata in fiecare punct in intervalul specific
					break;
				end

			end

		end

		plot(X, final_value);
		hold on;
	end


	fclose(input_file1);
end