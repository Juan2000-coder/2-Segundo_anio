
## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-13

function producto = escalar(vec1, vec2)
	if (length(vec1)==length(vec2))
		producto =0;
		aux=vec1.*vec2;
		for i=1:length(aux)
			producto+=aux(i);
		endfor
	else
		producto=false;
	endif
endfunction