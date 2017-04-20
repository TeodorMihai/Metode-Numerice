function [ ] = matrixCipher()

	[fid1, mesaj1] = fopen("input1A", 'r');

	[fid2, mesaj2] = fopen("key1A", 'r');
	[fid3, mesaj3] = fopen("output1A", 'w');

	
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
	
	S = strtrim(S); % nu e chiar corect ce am facut aici, dar asta rezolva probleme cu testele 7, 8
	[t m] = size(S); %am nevoie doar de 
	

	for i = 1:m
							
			if(toascii(S(i)) >= toascii('A') &&  toascii(S(i)) <= toascii('Z')) %daca e litera mare 
				C(i) = toascii(S(i)) - toascii('A') + 1; % merge sa fac asta pentru ca literele mari au aceeasi ordine ca cele mici in codul ascii :)
			end
	
			if(toascii(S(i)) >= toascii('a') &&  toascii(S(i)) <= toascii('z'))
				C(i) = toascii(S(i)) - toascii('a') + 1; %asociezi nnumar pentru fiecare litera
			
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

			%ascoiez numar si pentr restul caracterelor
	end
	
	if(mod(m, n)) % bag zerouri la sfarsit, doar daca e nevoie
		for i = m + 1:m + (n - mod(m, n))
			C(i) = 0;	
		end	
	end
	
	m = columns(C); %am bagat zerouri, s-a schimbat lungimea textului

	for i = 1: m / n
		D = C((i - 1) * n  + 1: i * n); % iau un bloc de n caractere

		R = D * A; % codific blocul

		for j = 1 : columns(R) % reconvertesc la caractere

			val = mod(R(j), 29);

			
			if(val == 0)
				x = ' ';
			endif
			
			if(val == 27)
				x = '.';
			endif
			
			if(val == 28)
				x = "'";
			endif
			
			if(val > 0  && val <= 26)
				x = char(val + toascii('a') - 1);
			end
	
			contor = fprintf(fid3, "%c", x);
		end
	end			
	
	fclose(fid1);
	fclose(fid2);
	fclose(fid3);
end
