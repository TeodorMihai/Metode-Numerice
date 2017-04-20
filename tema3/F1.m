function [] = F1() 
	%Neville
	input_file = fopen("dodel.txt", "r");

	m = fscanf(input_file, "%d", 1);
	n = fscanf(input_file, "%d", 1);
	for i = 1:n + 1
		tline = fgets(input_file); % citesc fiecare linie
		A = str2num(tline); % tranform in numere
		if(i == 1) %prima linie nu o sa fie contina nimic (e cea cu m si n)
			continue;
		end
		
		[t k] = size(A); %vad cate elemente am in vector
		k = k / 2;
		X = linspace(A(1), A(k), m); % creez punctele echidistante pe interval
		for j = k + 1 : 2 * k
			P(j - k) = A(j);
		end

		for j = 1:m % pentru fieacre punct aflu valoarea

			%in punctul A(j)
			%X(1) = 3;
			for l = k + 1: 2 * k
				P(l - k) = A(l); % y(i)
			end
			
			for t = 2 : k % a cate iteratie , polinom de grad t
				for g = t : k % cate polinoame calculez acum
					P2(g) = (X(j) - A(g)) * P(g - 1) - (X(j) - A(g - (t - 1) ) ) * P(g) ;
					P2(g) = P2(g) / (A(g - (t - 1)) - A(g));
				end
				P = P2;
			end
		final_value(j) = P2(k); % valoarea finala o sa fie ultimul element, structa piramidala
		end

		%desenez
		plot(X, final_value);
		hold on;
	end


	fclose(input_file);
end