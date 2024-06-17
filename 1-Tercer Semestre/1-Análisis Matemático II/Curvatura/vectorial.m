

## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-13

function producto = vectorial(vec1,vec2)
	if (length(vec1)==length(vec2))&&(length(vec1)==3)
		producto(3)=0;
		producto(1)=vec1(2)*vec2(3)-vec1(3)*vec2(2);
		producto(2)=vec1(3)*vec2(1)-vec1(1)*vec2(3);
		producto(3)=vec1(1)*vec2(2)-vec1(2)*vec2(1);
	else
		producto=false;
	endif
endfunction