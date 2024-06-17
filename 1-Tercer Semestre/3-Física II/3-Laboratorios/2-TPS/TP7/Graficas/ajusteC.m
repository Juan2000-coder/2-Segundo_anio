

function y = ajusteC (x)
	tm=[0;19.57;42.58;77.43;108.46];
	vm=0:5:20;
	puntos=[tm,reshape(vm,5,1)];
	A=coeficientesC(puntos);
	y=A(1)*(1-e.^(-A(2)*x));
endfunction
