function c = newtonalternativo(puntos)
	x = puntos(:,1);
	y = puntos(:,2);
	n = length(x);
	for i=1:n
		c(i) = y(i);
		p = 1;
		for j=1:i-1
			if j!=1
				p*=(x(i)-x(j-1)); 
			endif
			c(i)-=(c(j)*p);
		endfor
		if i!=1
			c(i)/=(p*(x(i)-x(i-1)));
		endif
	endfor
endfunction