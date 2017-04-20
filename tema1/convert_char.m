function[y] = convert_char(x) 
	if( x > 0 && x < 27)
		y = char(x + toascii('a') - 1);
	end

	if(x == 0)
		y = ' ';
	end

	if(x == 27)
		y = '.';
	end

	if(x == 28)
		y = "'";
	end
end	