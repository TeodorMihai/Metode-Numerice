function [x] = solJacobi(A, b, x0, tol, maxiter)

	[n n ]= size(A);
	D = diag(diag(A));
	L = (tril(A) - D);
	U = -(A - D - L);
	L = -L;
	
	%Jacobi 
	N = D;
	P = L + U;
	G = D^(-1) * (L + U);
	eroare = 10000;

	x_old = x0;
	x_new = x0;
	cnt = 0;

	while eroare > tol &&  cnt < maxiter

		for i=1:n
			s = 0;
			for j = 1:n 
				if(j != i)
					s = s + A(i, j)* x_old(j);
				end
			end

		x_new(i) = (b(i) - s) / A(i, i);
		eroare = norm(x_new - x_old)/norm(x_old);
		
		end
		cnt++;
		x_old = x_new;
	end

	x = x_new;
end