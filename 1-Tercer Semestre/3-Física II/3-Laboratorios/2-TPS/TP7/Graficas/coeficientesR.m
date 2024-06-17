

function A = coeficientesR(puntos)
	x=puntos(:,1);
	y=puntos(:,2);
	fi=[ones(length(x),1),x];
	A=inv(fi'*fi)*(fi')*log(y);
	A(1)=e^(A(1));
endfunction
