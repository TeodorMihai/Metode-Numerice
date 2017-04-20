function arie = integrala(v)
	arie = 0;
	for i = 1:length(v)
		arie = arie + fun((cos(2 * (i - 1) - 1) * pi)/(2* length(v) + 2))	;
	end

	arie = arie * pi / (length(v) + 1);
end