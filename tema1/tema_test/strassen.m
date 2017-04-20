function [] = strassen(str1, str2)

	
	format short;
	[fid1, mesaj1] = fopen(str1, 'r');
	[fid2, mesaj2] = fopen(str2, 'w');
	if(fid1 == -1)
		disp(mesaj1);
	end
	
	[n, contor] = fscanf(fid1, "%d", 1);
	[m, contor] = fscanf(fid1, "%f");
	[t1 t2] = size(m);
	t1 = sqrt(t1);

	frewind(fid1); % reseteaza cursorul

	[n, contor] = fscanf(fid1, "%d", 1);
	[A, contor] = fscanf(fid1, "%f", [t1 t1]);
	% Am facut niste smechheri cu cursorul ca sa aflu dimensiunea matricei

	A = A'; %fscanf e implementat aiurea cred. Nu am stiut cum sa rezolv asta.
	Aux = A;
	A = A ^ (-1);% inversa(A);

	B = putere_mat(A, n); % A = A ^ n

	%B = inversa(A); %B = A ^ (-1)

	for i = 1:t1
		for j = 1:t1
			contor = fprintf(fid2, "%.6f ", B(i, j));
		end
		contor = fprintf(fid2, "\n");
	end

	fclose(fid1);
	fclose(fid2);
end

