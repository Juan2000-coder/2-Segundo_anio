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
## @deftypefn {} {@var{retval} =} meteorologica2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-03

function meteorologica2()
	for i=1:5
		printf("\nTemperatura durante la hora %d: ", i);
		if i==1
			max=min=input('');
		elseif (aux=input(''))>max
			max=aux;
		elseif aux<min
			min=aux;
		endif
		clc;
	endfor
	printf("\nTemperatura maxima: %d", max);
	printf("\nTemperatura minima: %d\n", min);
endfunction
