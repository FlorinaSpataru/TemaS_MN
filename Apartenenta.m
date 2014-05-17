function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

	% am ales aleator numerele a si b
	a = 0.666; b = 0.13;

	% folosesc exact modelul functiei u(x)
	if ((x >= 0) && (x < val1))
		y = 0;

	elseif ((x > val2) && (x <= 1))
		y = 1;

	else
		y = a*x + b;

	end

end