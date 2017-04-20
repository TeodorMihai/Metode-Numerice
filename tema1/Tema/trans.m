function [ ] = transposition()

	[fid1, mesaj1] = fopen("input1C", 'r');

	[fid2, mesaj2] = fopen("key1C", 'w');
	[fid3, mesaj3] = fopen("output1C", 'w');

	
	if(fid1 == -1)
		disp(mesaj1);
	endif

	if(fid2 == -1)
		disp(mesaj2);
	endif

	if(fid3 == -1)
		disp(mesaj3);
	end
	
	[K, contor] = fscanf(fid1, "%d", 1);
	

	[n, contor] = fscanf(fid1, "%d", 1);
	[S, contor] = fscanf(fid1, "%c", inf);
	
	S = strtrim(S);
	[t m] = size(S);

	for i = 1:m
							
			if(toascii(S(i)) >= toascii('A') &&  toascii(S(i)) <= toascii('Z'))
				C(i) = toascii(S(i)) - toascii('A') + 1;
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

	if(mod(m, n))
		for i = m + 1:m + (n - mod(m, n))
			C(i) = 0;	
		end
	end
	oldm = m;
	m = columns(C);
	ct = 1;
	ok = 0;
	for i = 1: m / n
	
		D = C((i - 1) * n  + 1: i * n);

		R = eye(n + 1); % construiesc matricea de translatie, e de dimensiunea (n + 1) x (n + 1)


		for j = 1 : n 
			R(n + 1, j) = K; % e o martice In cu K pe ultima linie
		end


		if(ok == 0) % afisez prima matrice cu care am codificat
			for t1 = 1:n + 1
				for t2 = 1:n + 1
					contor = fprintf(fid2, "%d ", R(t1, t2));
				end
				contor = fprintf(fid2,"\n");
			end
			ok = 1;

			%Am afisat matricea de translatie, o singura data
		end

		D = [D , 1]; % adaug 1 la ce va trebui sa codific, dupa codificare sterg acest ultim element 
		
		if(i * n > ct * 1000 && (i - 1) * n <= ct * 1000) % aici formez o matrice care translateaza unele elemente cu k, iar altele cu k + 1
			

			for j = ct * 1000 + 1: i * n 
				R(n + 1, n - (j - ct * 1000 - 1)) = K + 1;
			end
			ct = ct + 1;
			K = K + 1;
		end
		R = D * R;

		R = R(1 : n);

		count = 0; % am nevoie de count ca sa stiu cate elemente nu mai afisez la final
		for j = 1 : columns(R)

			val = mod(R(j), 29);
			count = count + 1;
			
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

			if(i == m/n && count > mod(oldm,n)  && mod(oldm, n) ) continue; % sunt elemente bagate de noi in plus ca sa avem blocuri de n elemente
			end
				contor = fprintf(fid3, "%c", x);
		end
		%contor = fprintf(fid3, "\n");
	end			
	

end
