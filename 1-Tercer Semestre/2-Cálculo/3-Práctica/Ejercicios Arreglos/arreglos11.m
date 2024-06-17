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
## @deftypefn {} {@var{retval} =} arreglos11 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-09

function producto = arreglos11 (matriz1, matriz2)
	clc;
	if (columns(matriz1)==rows(matriz2))
		producto(rows(matriz1), columns(matriz2))=0;
		for i=1:rows(matriz1)
			for j=1:columns(matriz2)
				for k=1:columns(matriz1)
					producto(i,j)+=matriz1(i,k)*matriz2(k,j);
				endfor
			endfor
		endfor
	else
		printf("\nNo se puede hacer la operacion.\n");
	endif
endfunction
