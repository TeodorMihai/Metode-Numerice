function [ ] = decrypt()

	[fid1, mesaj1] = fopen("input1B", 'r');

	[fid2, mesaj2] = fopen("key1B", 'r');
	[fid3, mesaj3] = fopen("output1B", 'w');

	
	if(fid1 == -1)
		disp(mesaj1);
	endif

	if(fid2 == -1)
		disp(mesaj2);
	endif

	if(fid3 == -1)
		disp(mesaj3);
	endif
	
	[S, contor] = fscanf(fid1, "%c", inf);
	

	[n, contor] = fscanf(fid2, "%d", 1);
	[A, contor] = fscanf(fid2, "%d", [n ,n]);
	
	%S = strtrim(S); nu mai am nevoie de chesti asta, nu mai sunt teste tricky :)
	[t m] = size(S);
	

	for i = 1:m
							
			if(toascii(S(i)) >= toascii('A') &&  toascii(S(i)) <= toascii('Z'))
				C(i) = toascii(S(i)) - toascii('A') + 1; % merge sa fac asta pentru ca literele mari au aceeasi ordine ca cele mici in codul ascii :)
			endif
	
			if(toascii(S(i)) >= toascii('a') &&  toascii(S(i)) <= toascii('z'))
				C(i) = toascii(S(i)) - toascii('a') + 1;
			
			end
			
			if(S(i) == ' ')
				C(i) = 0;
			end
			
			if(S(i) == '.')
				C(i) = 27;	
			end
		
			if(S(i) == "'")
				C(i) = 28;
			end

	end

	if(mod(m, n)) %bag zerouri doar daca e nevoie
		for i = m + 1:m + (n - mod(m, n))
			C(i) = 0;	
		end
	end
	
	m = columns(C);
	B = inv_mod(A, 29); % fac Gauss mod p
	for i = 1: m / n
		D = C((i - 1) * n  + 1: i * n);

		R = D * B;
		

		for j = 1 : columns(R)

			val = mod(R(j), 29);

			
			if(val == 0)
				x = ' ';
			endif
			
			if(val == 27)
				x = '.';
			endif
			
			if(val == 28)
				x = "'";
			end
			
			if(val > 0  && val <= 26)
				x = char(val + toascii('a') - 1);
			end
			% am convertit inapoi din numere la caractere
	
			contor = fprintf(fid3, "%c", x);
			
		end
	end			
	
	fclose(fid1);
	fclose(fid2);
	fclose(fid3);
end
