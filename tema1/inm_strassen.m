function [C] = inm_strassen(A, B) %echivalent cu C = A * B

	[na ma] = size(A);
	[nb mb] = size(B);

	%if na > 8 || ma > 8 || mb > 8
	%	C = A * B;
	%	return ;
	%end

	n = max(na, max(ma, max(nb, max(mb)))); %aflam cea mai mare dimensiune a matricilor, necesar pentru completarea cu 0 
	n = nextpow2(n); 
	
	d = 2^n; % fixez dimensiunea matricilor, urmeaza sa le completez cu zeroui	

	newA = zeros(d); %folosesc astea ca sa completez mai repede cu zerouri
	newB = zeros(d);
	
	newA(1:na, 1:ma) = A; %practic pune matricea A peste matricea newA, incepand din (1, 1)
	newB(1:nb, 1:mb) = B;
	
	half_d = d/2; %pentru partitionare

	A11 = newA(1:half_d, 1:half_d);
	A12 = newA(1:half_d, half_d + 1:d);
	A21 = newA(half_d + 1:d, 1:half_d);
	A22 = newA(half_d + 1:d, half_d + 1:d);

	%partitonarea astfel:
	% A =  [A11 A12]
	%      [A21 A22]
	

	B11 = newB(1:half_d, 1:half_d);
	B12 = newB(1:half_d, half_d + 1:d);
	B21 = newB(half_d + 1:d, 1:half_d);
	B22 = newB(half_d + 1:d, half_d + 1:d);

	%la fel ca la A
	
	M1 = (A11 + A22) * (B11 + B22);
	M2 = (A21 + A22) * 	B11;
	M3 = A11 * (B12 - B22);
	M4 = A22 * (B21 - B11);
	M5 = (A11 + A12) * B22;
	M6 = (A21 - A11) * (B11 + B12);
	M7 = (A12 - A22) * (B21 + B22);

	%Fcaem niste smecherii sa scapam de o inmultire din 8 

	C11 = M1 + M4 - M5 + M7;
	C12 = M3 + M5;
	C21 = M2 + M4;
	C22 = M1 - M2 + M3 + M6;

	%Continuam smecheriile

	C = [C11, C12;C21 C22];
	C = C(1 : na, 1 : mb);
	%Obtinem matricea finala si taiam zerourile de pe margini

end
