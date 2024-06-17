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
## @deftypefn {} {@var{retval} =} arreglos5 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-08

function arreglos5()
	i=aux=0;
	printf("\nIndique la cantidad de elementos de los vectores: "),
	n=input(''); aux=int64(n); aux= n-double(aux);
	if(n>0)&&(!aux)
		vec1(1,n)=vec2(1,n)=diferencia(1,n)=0;
		for i=1:n
			clc;
			printf("\nIndique el elemento %d del primer vector: ", i);
			vec1(i)=input('');
			printf("Indique el elemento %d del segundo vector: ", i);
			vec2(i)=input('');			
			diferencia(i)=vec1(i)-vec2(i);
		endfor
		clc;
		printf("\nPrimer vector: ");disp(vec1);
		printf("\nSegundo vector: ");disp(vec1);
		printf("\nDiferencia: ");disp(diferencia);
	else
		printf("\nEl parametro debe ser natural.\n");
	endif
endfunction
