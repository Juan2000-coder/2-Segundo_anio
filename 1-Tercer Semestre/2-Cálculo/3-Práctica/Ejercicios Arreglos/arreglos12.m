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
## @deftypefn {} {@var{retval} =} arreglos12 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-09

function matriz=arreglos12()
	clc;clear;i=1;
	printf("\nCargue una matriz cuadrada sin ceros en su diagonal principal.");
	printf("\nIndique el orden de la matriz: "); n=input('');
	matriz=arreglos10(n,n);#vamos a suponer que inrgesa bien los datos
	while (i<n)&&(matriz(i,i))
		i++;
	endwhile
	if(!matriz(i,i))
		printf("\nLa matriz tiene al menos un cero en su diagonal.\n");
	else
		for i=1:n
			for j=1:n
				if(i>=j)
					matriz(i,j)=matriz(i,j)/matriz(i,i);
				endif
				if(i<j)
					matriz(i,j)=0;
				endif
			endfor
		endfor
	endif
endfunction
