function [] = CenterOfFighterJet(str) 

	input_centroid = [str "/contur.in"];
	input_file = fopen(input_centroid, "r");

	n = 0;
	tline = [1 2 3];
	while 1
		n = n + 1;
		tline = fgets(input_file); % citesc fiecare linie
		if(length(tline) < 3)
			break;
		end
		
		A = str2num(tline);
		X(n) = A(1);
		Y(n) = A(2);
	end


	fclose(input_file);

	[x y] = CentroidOfSurface(X, Y);
	printf("Centroid of Surface: x = %.3f y = %.3f\n", x, y);
	for k = 0:6

		k_s = mat2str(k);

		X = 0; Y = 0;
		input_trapez = [str "/date" k_s ".in"];
		input_file = fopen(input_trapez, "r");


		n = 0;
		tline = [1 2 3];
		
		while 1
			n = n + 1;
			tline = fgets(input_file); % citesc fiecare linie
			if(length(tline) < 3)
				break;
			end
			
			A = str2num(tline);
			X(n) = A(1);
			Y(n) = A(2);
		end


		B(k + 1) = Trapez(X, Y);
		fclose(input_file);
		
	end
	printf("\n");

	for k = 0:6

		k_s = mat2str(k);
		%concaternez ca sa obtin toata fisierele automa
		X = 0; Y = 0;
		input_simpson = [str "/date" k_s ".in"];
		input_file = fopen(input_simpson, "r");


		n = 0;
		tline = [1 2 3];
		
		while 1
			n = n + 1;
			tline = fgets(input_file); % citesc fiecare linie
			if(length(tline) < 3) %linia are niste elemente
				break;
			end
			
			A = str2num(tline);
			% x y z
			X(n) = A(1);
			Y(n) = A(2);
			Z(k + 1) = A(3);
		end


		Simpson(X, Y);
		%calculez si centroidul pentru a calcula centrul de masa a figurii totale
		%acesta fiind compunerea totala a centroidelor celor 7 figuri(au aceeasi densitate deci centrul lor de amsa este echivalent cu centroidul)

		if(k == 0) 
			continue;
		end;
		[x y] = CentroidOfSurface(X, Y);

		

		C(1, k) = x;
		C(2, k) = y;
		C(3, k) = Z(k + 1);
		fclose(input_file);
		
	end;
	printf("\n");


	input_densitate = [str "/densitati.in"];
	input_file = fopen(input_densitate, "r");

	D = fscanf(input_file, "%f", 7);


	mass = 0 ;
	volume = 0;

	vector_mass = 0 ;

	
	for i = 2:7

		% B-urile sunt ariile, aproximez aria unei sectiuni ca media aritmetica dintre ariile sectiunilor vecine
		% z-urile sunt inaltimile, volum = arie * h, h  este diferenta coordonatelor inaltimilor
		volume = volume + (Z(i) - Z(i - 1)) * (B(i) +  B(i - 1)) / 2;
		mass = mass + (Z(i) - Z(i - 1)) * (B(i) +  B(i - 1)) * D(i - 1)/ 2;
		vector_mass(i - 1) = (Z(i) - Z(i - 1)) * (B(i) +  B(i - 1)) * D(i - 1)/ 2; 
		%retin masele pentru fiecare sectiune, ne trebuie la centrul de masa
	end
	%calculam centru de masa al corpului, stiind masa si centroidul fiecarei parti

	xmass = 0;
	ymass = 0;
	zmass = 0;

	for i = 1:6
		xmass = xmass +  vector_mass(i) * C(1,  i); %c(1, i) coordonate x
		ymass = ymass + vector_mass(i) * C(2, i); % coorodnata y
		zmass = zmass + vector_mass(i) * (Z(i) + Z(i + 1)) / 2; % coordonata z a centrului de masa pt fasia i, va fii 
		% media celor 2 valori, pentru ca fiecare secitune este simetrica fata de planul XoY

	end
	

	printf("Volume of plane: %.3f\nMass of plane: %.3f\n", volume, mass);
	printf("Center of mass: x = %.3f y = %.3f z = %.3f\n", xmass / mass, ymass / mass, zmass/ mass);

	
end