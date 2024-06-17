## Copyright (C) 2021 Juan
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} puntomedioiterativo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-08

function puntomedioiterar(limite, tolerancia)
	puntos(2,2)=0;
	xm=i=0;ym=tolerancia+1;
	while (i<=limite)&&(abs(ym)>=tolerancia)
		clc;
		i++;
		for k=1:2
			printf("\nIndique el valor de x del punto %d: ", k);
			puntos(k,1)=input('');
			printf("Indique el valor de y del punto %d: ", k);
			puntos(k,2)=input('');
			clc;
		endfor
		xm=(puntos(1,1) + puntos(2,1))/2;
		ym=(puntos(1,2) + puntos(2,2))/2;
		printf("\nPuntos medio:  [%d, %d]", xm, ym);
	endwhile
	if (abs(ym) <=tolerancia)
		printf("\nLa ordemada del punto medio esta dentro de la tolerancia:");
		printf("\nFueron %d iteraciones\n", i);
	else
		clc;
		printf("\nExcedido el limite de iteraciones:\n");
	endif
endfunction
