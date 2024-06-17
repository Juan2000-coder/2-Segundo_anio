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
## @deftypefn {} {@var{retval} =} meteorologica (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-03

function meteorologica ()
	media=0;
	for i=1:24
		printf("Temperatura hora %d: ", i);
		media = ((i-1)*media+input(""))/i;
		printf("\nTemperatura media a la hora %d:  %d", i, media);
		input('');
		clc;
	endfor
	printf("\nTemperatura media a lo largo del dia: %d\n", media);
endfunction
