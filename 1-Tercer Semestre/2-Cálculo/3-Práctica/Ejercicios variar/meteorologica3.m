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
## @deftypefn {} {@var{retval} =} meteorologica3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-03

function meteorologica3()
	suma_m=0;
	suma_d=0;
	m=5;
	d=3;
	for i=1:m
		suma_d=0;
		for j=1:d
			printf("Temperatura durante la hora %d: ", j);
			suma_d+=input("");
			clc;
		endfor
		suma_m+=suma_d;
		printf("Temperatura media durante el dia: %d\n", suma_d/d);
		printf("Temperatura media mensual al dia de hoy: %d\n", suma_m/(i*d));
		printf("Presione una tecla: \n");
		input('');clc;
	endfor
	printf("Temperatura media mensual: %d\n", suma_m/(m*d));
endfunction
