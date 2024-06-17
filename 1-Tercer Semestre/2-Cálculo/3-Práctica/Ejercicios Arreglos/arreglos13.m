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
## @deftypefn {} {@var{retval} =} arreglos13 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-09

function arreglos13 ()
	clc;clear;norma=0;
	printf("\nIngrese una matriz cuadrada.");
	printf("\nIndique el orden de la matriz: "); n=input('');
	matriz=arreglos10(n,n);#suponer que ingresa bien los parametros
	if matriz!=0
		for i=1:n
			for j=1:n
				if (i==1)&&(j==1)
					norma=abs(matriz(i,j));
				elseif abs(matriz(i,j))>norma
					norma=abs(matriz(i,j));
				endif
			endfor
		endfor
		printf("\nLa norma de la matriz es : %d\n", norma);
	else
		printf("\nMatriz nula.\n")
	endif
endfunction
