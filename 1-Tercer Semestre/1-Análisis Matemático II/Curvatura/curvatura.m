

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-13

function k = curvatura(v, a)
	if ((l=length(v))==length(a))
		if l==3
			k=norma(vectorial(v,a))/(norma(v)^3);
		else
			k=sqrt((norma(v)^2)*(norma(a)^2)-(escalar(v,a)^2))/(norma(v)^3);
		endif
	else
		k=false;
	endif
endfunction
