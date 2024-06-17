
function y = nuevoajusteC (t)
	tmC=[0;19.57;42.58;77.43;108.46];
	vmC=reshape(0:5:20,5,1);
	a0=30;
	a1=(tmC'*(-log(1-vmC/a0)))/(tmC'*tmC);
	y=a0*(1-e.^(-a1*t));
endfunction
