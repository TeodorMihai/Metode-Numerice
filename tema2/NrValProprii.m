function numvp=NrValProprii(d,s,lambda);
p=ValoriPolinoame(d,s,lambda);
[n]=length(p);
numvp=0;

for i=2:n
	
	if(p(i) != 0)
		if(p(i) * p(i - 1) < 0)
		numvp = numvp + 1;
		end
	end
	
	if(p(i) == 0)
		numvp++;
		if(p(i - 1) > 0)
			p(i) = -1;
		else
		 p(i) = 1;	
		end
	end
endfor
endfunction
