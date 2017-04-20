function [valp vecp] = PutereInv(d, s, h, y, maxIter, epsilon)

	y_old = y ;
	y_new = y ;

	k = 1;
	valp = h;
	
	%A = diag(d, 0) + diag(s, 1) + diag(s, - 1); pentru debugging
	
	[n n] = size(diag(d));

	while(k <= maxIter  && norm(inmultire(d, s, y_new)' - valp * y_new) > epsilon)

		for i = 1:n 
			aux_d(i) = d(i) - h;
		end

		z = Thomas(aux_d, s, y_old); % face practic ce face si linia de mai jos, rezolva sistemul
		%z = (A - h * eye(n)) ^ (-1) * y_old;
		z = z';

		y_new = z / norm(z, 2);

		valp = inmultire(d, s, y_new) * y_new; % functia inmultire, inmulteste matricea formata cu d si s cu un vector, fara sa construiasca matricea !!
		%echivalent cu linia de mai jos
		%valp = y_new' * A * y_new;

		h = valp;
		k = k + 1;
		y_old = y_new;

	end

	vecp = y_new; %valoarea proprie
end