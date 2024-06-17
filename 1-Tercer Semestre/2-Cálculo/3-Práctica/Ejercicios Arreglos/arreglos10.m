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
## @deftypefn {} {@var{retval} =} arreglos10 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-09

function matriz =arreglos10(m,n)
	matriz=0;
	aux1=int64(n); aux1=n-double(aux1);
	aux2=int64(m); aux2=m-double(aux2);
	if(!aux1)&&(!aux2)&&(n>0)&&(m>0)
		for i=1:m
			for j=1:n
				printf("\nElemento %d de la fila %d: ", j, i);
				matriz(i,j)=input('');
				clc;
			endfor
		endfor
	else
		printf("\nLos parametros deben ser naturales.\n");
	endif
endfunction
