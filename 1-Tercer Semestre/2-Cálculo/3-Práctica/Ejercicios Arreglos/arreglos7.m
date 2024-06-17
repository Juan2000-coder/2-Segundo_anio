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
## @deftypefn {} {@var{retval} =} arreglos7 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-08

function arreglos7 ()
	norma3=0;
	[norma1, vec1, flag1]=arreglos1();clc;
	[norma2, vec2, flag2]=arreglos1();clc;
	if(flag1&&flag2)
		diferencia=vec1-vec2;
		if diferencia!=0
			for i=1:(length(diferencia))
				clc;
				norma3+= (diferencia(i)^2);
			endfor
			norma3= sqrt(norma3);
			diferencia=diferencia/norma3;
			printf("\nVector normalizado: \n");
			disp(diferencia);
		else
			printf("\nLa norma del vector diferencia es nula.\n")
		endif
	else
		printf("\nError.\n");
	endif
endfunction
