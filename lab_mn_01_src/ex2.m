x = 0 : 0.1 : 1;
fid = fopen("valori.txt", "w");
for x=[0:0.1:1]
	fprintf(fid, "%f\n", 2 * x + 1);
endfor 

fclose(fid);
