%Funcion sobre la cual trabajamos%

function A = coeficientesC(puntos)
	tol=1e-12;maxiter=1000;
	t=puntos(:,1);
	V=puntos(:,2);
	flag=true;k=0;
	A=[30;1/94];
	while flag
		k++;
		dfa0=1-e.^(-(A(2)*t));
		dfa1=A(1)*(t.*(e.^(-A(2)*t)));
		Z=[dfa0,dfa1];
		D=V-A(1)*(1-e.^(-A(2)*t));
		deltaA=inv(Z'*Z)*(Z')*D;
		Anueva=A+deltaA;
		E=100*(deltaA./Anueva);
		err=norm(E,inf);
		if err<=tol
			flag=false;
			%printf("Aproximación dentro de la tolerancia\n.");
		endif
		if k>=maxiter
			flag=false;
		endif
		A=Anueva;
	endwhile
	%printf("Iteraciones: %d\n",k);
endfunction