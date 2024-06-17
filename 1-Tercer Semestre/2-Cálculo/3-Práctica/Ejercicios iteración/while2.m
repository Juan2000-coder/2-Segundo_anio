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
## @deftypefn {} {@var{retval} =} while2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-07

function while2()
	%Reales(x0,f,it)
	x0=f=0;it=1;
	printf("\nIndique el numero %d: ", it);
	x0 = input('');
	f = 3*(x0^2)-12;
	while((it<=100)&&(f!=0))
		clc;
		it++;
		printf("\nIndique el numero %d: ", it);
		x0 = input('');
		f = 3*(x0^2)-12;
	endwhile
	clc;
	if((it==100)&&(f!=0))
		printf("\nSe superaron los intentos permitidos.\n");
	else
		printf("\nSe encontro la raiz %d, en el intento %d\n", x0, it);
	endif
endfunction
