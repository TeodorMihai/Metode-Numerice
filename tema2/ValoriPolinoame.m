function [P] = ValoriPolinoame(d, s, val_lambda)
	%Intrari:
	% d = diagonala princiapal a matricei tridiagonale simterice
	% s = supradiagonala matricei tridiagonale simetrice
	% val_lambda = valoarea pentru care se calculeaza numerul de radacini mai mic decat ea
	%Iesiri:
	% P: vectorul = [ P0(val_lambda) P1(val_lambda) P2(val_lambda) ... Pn(val_lambda)]

	%initializare primele 2 valori pentru recurenta
	
	
	D = diag(d, 0) + diag(s, 1) + diag(s, - 1); %construiesc matricea, doar pentru debug
	n = columns(D); % dimesniunea matricei
	
	P(1) = 1;
	P(2) = d(1) - val_lambda;

	for i = 3:n + 1
		
		P(i) = (d(i - 1) - val_lambda) * P(i - 1) - s(i - 2) * s(i - 2) * P(i - 2);
	end	

end