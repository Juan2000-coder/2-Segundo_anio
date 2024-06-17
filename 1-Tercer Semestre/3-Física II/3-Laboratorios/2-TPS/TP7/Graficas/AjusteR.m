

function y = AjusteR (t)
	tmR=[0;15.98;38.73;75.56;114.52];
	vmR=reshape(30:-5:10,5,1);
	puntos=[tmR,vmR];
	A=coeficientesR(puntos);
	y=A(1)*e.^(A(2)*t);
endfunction
