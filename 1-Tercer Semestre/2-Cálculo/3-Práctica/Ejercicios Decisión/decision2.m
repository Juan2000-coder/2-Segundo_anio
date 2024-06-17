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
## @deftypefn {} {@var{retval} =} mayornum (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-03


function max = maxnum(varargin)
	if nargin!=0 
		flag=0;
		max=varargin{1};
		for i=1:length(varargin)
			if varargin{i}>= max
				max=varargin{i};
				flag+=1;
			endif
		endfor
		if ((max==varargin{1})&&(flag==length(varargin)))
			max = "no hay maximo elemento";
		endif
	else
		max= "no se ingresaron numeros";
	endif
endfunction
