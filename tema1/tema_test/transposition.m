function[] = transposition()
	
	read = fopen("input1C", "r"); 
	file_write = fopen("output1C", "w");
	file_matrix = fopen("key1C", "w");

	K = fscanf(read, "%d", 1);
	N = fscanf(read, "%d", 1);
	str  = fscanf(read, "%c", inf);

	
	D = columns(str);
	for k = 1:D - 1
		str(k) = str(k + 1);
	end
	D = D - 1;
	%Am un spcae la inceput
	for i = 1:D
		V(i) = convert_int(str(i));
	end


	new_d = D;

	while(mod(new_d, N) != 0) % umplu cu zerouri pentru a forma blocuri de n elemente
		new_d = new_d  + 1;
		V(new_d) = 0;
	end
	
	nr = 1;

	for i = 1:new_d/N %new_d / n inmultiri cu matricea

		B = V( (i - 1) * N + 1: i * N) ;
		 % selectez cele n elemente care ma intereseaza si inmultesc cu matricea A

		B(N + 1) = 1;
		%construieasc matricea de translatie


		A = eye(N + 1);

		for j = 1: N 
			A(N + 1, j) = K;
		end
		
		if((i - 1) * N  + 1 < nr * 1000 && i * N >= nr * 1000 )  % cand se face de la un caracter cu index divizibil cu 1000 trebuie modificata matricea

			for t = (i - 1) * N + 1 : i * N
				
				A(N + 1, t - (i - 1) * N) = K; 
				
				if(t == nr * 1000) % o sa am K + 1 de la indicele care corespunde unui nr divizibil cu 1000
					K = K + 1;
				end

			end
			nr = nr + 1;

		end

		B = B * A;

		B = mod(B, 29);
		

		if(i == new_d/N) %am adaugat niste zerouri ca sa pot face codificicare, acum scap de ele
			limit = N - (new_d - D) - 1;
				else 
			limit = N;
		end
		for j = 1:limit
			
			contor = fprintf(file_write, "%c", convert_char(B(j)));
		
		end

		if(i == 1)  % afisez matricea cu care codific primele 1000 de elemente
			for k1 = 1: N + 1
				for k2 = 1:N + 1
					fprintf(file_matrix, "%d ", A(k1,  k2));
				end

				fprintf(file_matrix, "\n");
			end
		end
	end


end