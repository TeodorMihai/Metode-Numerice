function[y] = convert_int(x)

	y = 0;
	
	if(x >= 'a' && x <= 'z')
		y = x - 'a' + 1;
	end

	if(x >= 'A' && x <= 'Z')
		y = x - 'A' + 1;
	end

	if(x == ' ')
		y = 0;
	end

	if(x == "'")
		y = 28;
	end 

	if(x == '.')
		y = 27;
	end


end