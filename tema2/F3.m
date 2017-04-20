
function [] = F3() 
	%Neville
	input_file1 = fopen("realmadrid.txt", "r");

	m = fscanf(input_file1, "%d", 1);
	n = fscanf(input_file1, "%d", 1);
	m
	
	for i = 1:n + 1
		tline = fgets(input_file1);
		A = str2num(tline);

		if(i == 1)
			continue;
		end
		
		[t k] = size(A);
		k = k / 2;
		X = linspace(A(1), A(k), m);
		for j = k + 1 : 2 * k
			P(j - k) = A(j);
		end


		for j = 1:m

			%in punctul A(j)
			%X(1) = 3;
			ok = 0;
			for i = 1:k - 1
				if(X(j) >= A(i) && X(j) <=  A(i + 1))
					final_value(j) = P(i) +  ((P(i + 1) - P(i) ) / (A(i + 1) - A(i)) ) * (X(j) - A(i));
					ok = 1;
					break;
				end

			end

		end

		plot(X, final_value);
		hold on;
	end


	fclose(input_file1);
end