function eval(fis,fis2)
	fid=fopen(fis,"r");
	fid2=fopen(fis2,"r");
	fid3=fopen("verificare","w");
	l1=fscanf(fid,"%lf");
	l2=fscanf(fid2,"%lf");
	x=1;
	n=length(l1);
	if length(l1)~=length(l2)
		x=0;
	else
		for i=1:n
			if abs (l1(i)-l2(i)) >0.001
				x=0;
				break;
			endif
		endfor
	endif
	fprintf (fid3, "%d\n", x);
	fclose(fid3);
endfunction
