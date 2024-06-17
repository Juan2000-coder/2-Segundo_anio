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
## @deftypefn {} {@var{retval} =} interseccion (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-03

function raiz = interseccion (A, B)
	if any(A!=B)
		if(m = pendiente(A,B))&&(m!=inf)
			raiz=-A(1,2)/m + A(1,1);
		elseif(!m)&&(A(1,2)==0)
			raiz="todos los puntos en el eje x";
		elseif(!m)&&(A(1,2)!=0)
			raiz= "nula";
		elseif(m==inf)
			raiz= A(1,1);
		endif
	else
		raiz= "indeterminada";
	endif
endfunction
