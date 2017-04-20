function [B] = strassen()

	[fid1, mesaj1] = fopen("strassen.in", 'r');
	[fid2, mesaj2] = fopen("strassen.out", 'w');

	[n, contor] = fscanf(fid1, "%f", 1);
	[m, contor] = fscanf(fid1, "%f");
	[t1 t2] = size(m);
	t1 = sqrt(t1);

	frewind(fid1); % reseteaza cursorul

	[n, contor] = fscanf(fid1, "%f", 1);
	[A, contor] = fscanf(fid1, "%f", [t1 t1]);
	% Am facut niste smechheri cu cursorul ca sa aflu dimensiunea matricei

	A = A'; %fscanf e implementat aiurea cred. Nu am stiut cum sa rezolv asta.


	A = putere_mat(A, n); % A = A ^ n

	B = inversa(A); %B = A ^ (-1)

	for i = 1:t1
		for j = 1:t1
			contor = fprintf(fid2, "%.3f ", B(i, j));
		end
		contor = fprintf(fid2, "\n");
	end
end

