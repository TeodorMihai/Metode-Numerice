N = 0 ;
eye(M);
fid = fopen("fisier.txt", "r");
N = fscanf(fid, "%d");
for i = [1 : 1 : N]
	for j = [ 1: 1: N]
		M(i,j) = fscanf(fid, "%d"); 
	endfor
endfor

disp(N);


fclose(fid);
