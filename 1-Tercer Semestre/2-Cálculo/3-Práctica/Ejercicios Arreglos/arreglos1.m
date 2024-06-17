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
## @deftypefn {} {@var{retval} =} arrerglos1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-08

function [norma, vec, flag] = arreglos1()
	n=aux=norma=0;flag=false;
	printf("\nIndique la cantidad de elementos del vector: ");
	n=input('');aux=int64(n);aux = n-double(aux);
	if (n>0)&&(!aux)
		flag=true;
		vec(1,n);
		for i=1:n
			clc;
			printf("\nIngrese el elemento %d: ", i);
			aux = input('');
			vec(i)=aux;
			norma+= (aux^2);
		endfor
		clc;
		norma= sqrt(norma);
		printf("\nLa norma del vector es %d: \n ",norma);
	else
		printf("\nEl parametro debe ser un numero natural.\n")
		vec=0;
	endif
endfunction
