## Copyright (C) 2021 Juan
%Metodo directo

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-05-11

function coeficientes = directo(puntos)
	x=puntos(:,1);
	y=puntos(:,2);
	for j=1:length(x)
		A(:,j)=x.^(j-1);
	endfor
	x0=10*rand(length(x),1);
	coeficientes=GS(A,y,x0,100,1e-12);
endfunction