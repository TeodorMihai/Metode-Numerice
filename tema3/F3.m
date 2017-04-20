
function [] = F3() 
	
	input_file1 = fopen("realmadrid.txt", "r");

	m = fscanf(input_file1, "%d", 1);
	n = fscanf(input_file1, "%d", 1);
	

	
	

	for i = 1:n + 1
		tline = fgets(input_file1);
		A = str2num(tline);

		if(i == 1)
			continue;
		end
		
		[t k] = size(A);
		k = k / 2;
		% cream matricea W
		%cream un vector subinterval cu subintervale
		

		X = linspace(A(1), A(k), m);


		for j = k + 1 : 2 * k
			Y(j - k) = A(j);
		end

		%sortare bubble sort
		
		for q = 1:k
			for z = q + 1:k
				if(A(q) > A(z)) 
					aux = A(q);
					A(q) = A(z);
					A(z) = aux;

					aux = Y(q);
					Y(q) = Y(z);
					Y(z) = aux;
				end
			end
		end

		% cream matricea W
		%cream un vector subinterval cu subintervale
		subinterval = zeros(k - 1, 1);

		for j = 1:k - 1
			subinterval(j) = A(j + 1) - A(j);
		end

		% Vom crea matricea sistemului W, sistem de k * k
		W = zeros(k);
		%fiind spline natural o sa avem derivatele in capte 0, asta se traduce astfel:
		W(1, 1) = 1;
		W(k, k) = 1;

		%W = W + diag(subinterval, 1); %desupra digonale princiaple punem practic lungimea intervalelor

		for j = 2:k - 1
			W(j , j + 1) = subinterval(j);
			W(j, j - 1) = subinterval(j - 1);
			W(j, j) = 2 * (subinterval(j - 1) + subinterval(j));
		end

		%cream vectorul termenilor liberi b
		b = zeros(k, 1);

		for j = 2 : k - 1
			 b(j) = (3/subinterval(j))*(Y(j+1)-Y(j)) - (3/subinterval(j-1))*(Y(j)-Y(j-1));
		end

		cj = W^ (-1) * b; % rezolvam sistemul, obtinem coeficientii c

		% coeficientii bj
		bj = zeros(k-1,1);
		for j = 1:k-1
		 bj(j) = (1/subinterval(j))*(Y(j+1)-Y(j)) - (1/3*subinterval(j))*(2*cj(j)+cj(j+1));
		end
		 
		% coeficientii  dj:
		dj = zeros(k-1,1);
		for j = 1:k-1
		 dj(j) = (1/(3*subinterval(j))) * (cj(j+1)-cj(j));
		end

		for j = 1:m
			for q = 1: k -1
				if(X(j) >= A(q) && X(j) <= A(q + 1))

					final_value(j) = S_i(Y(q), bj(q),cj(q) ,dj(q), X(j), A(q));	
					break;
				end
			end
		end
		plot(X, final_value);
		hold on;
	end


	fclose(input_file1);
end