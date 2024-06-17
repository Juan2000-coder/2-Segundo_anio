%secante%
function r = secante(a,b,f,tol,maxiter)
	if f(a)!=f(b)
		flag=true;k=0;
		while flag
			k++;
			m=(f(b)-f(a))/(b-a);
			aux=a;
			a-=(f(a)/m);
			b=aux;
			err=abs(f(a));
			if err<=tol
				flag=false;
				printf("Aproximacion dentro de la tolerancia.\n");
			endif
			if k>=maxiter
				flag=false;
			endif
			if f(a)==f(b)
				printf("Pendiente nula.\n");
				flag=false;
			endif
			grafica(1,k)=k;
			grafica(2,k)=a;
		endwhile
		r=a;
		printf("Valor absoluto de la raiz: %d\n",abs(f(r)));
		printf("Numero de iteraciones: %d\n", k);
		figure(1)
		hold on;grid on;
		title("Aproximaciones");
		plot(grafica(1,:), grafica(2,:), "--.b","markersize",10);xlabel("iteraciones");ylabel("aproximaciones");
		figure(2)
		hold on;grid on;
		intervalo = r-1:0.1:r+1;
		title("Grafica alrededor de la raiz")
		plot(intervalo, f(intervalo), "r");xlabel(num2str(r));ylabel("Y");
		plot(r,f(r),"k","markersize",10);
	else
		r=false;
		printf("No se puede aplicar el matodo.\n");
	endif
endfunction