## Copyright (C) 2021 Juan

%Polinomios de Newton

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-05-11

function  coeficientes = newton(puntos)
	x=puntos(:,1);
	y=puntos(:,2);
	for j=1:length(x)
		if j==1
			A(:,j)=ones(length(x),1);
		else
			A(:,j)=A(:,j-1).*(x-(x(j-1)*ones(length(x),1)));
		endif
		coeficientes(j)=y(j);
		for k=1:(j-1)
			coeficientes(j)-=(coeficientes(k)*A(j,k));
		endfor
		coeficientes(j)/=A(j,j);
	endfor
endfunction