function [B] = putere_mat(A, n) %inmultire in timp logaritmic, folosesc A ^ x, pentru a calcula A^ 2x si tot asa
	
	if(n == 0) %In elmentul enutru la inmultire
		B = eye(n);
		return ;
	end

	if(n == 1) %A ^ 1 = A
		B = A;
		return ;
	end
	
	%idivide(5, 2, "fix")
	C = putere_mat(A, idivide(n, 2, "fix")); %idivide = impartire cu partea fractionara rotunjita la 0
	
	if(mod(n, 2))
		B = inm_strassen(C, inm_strassen(C, A)); % B = C * C * A
	else
		B = inm_strassen(C, C); % B = C * C
	end

	
end	