%regula falsi%

function r = E3(a, b, f,tol, maxiter)
	if (f(a)*f(b))<0
		flag=true; k=0;
		while flag
			k++;
			m=(f(a)-f(b))/(a-b);
			r=a-(f(a)/m);
			err=abs(f(r));
			if (f(r)*f(a))<0
				b=r;
			else
				a=r;
			endif
			if err<=tol
				printf("Aproximacion dentro de la tolerancia.\n");
				flag=false;
			endif
			if k>=maxiter
				flag=false;
			endif
			if f(a)==f(b)
				flag=false;
				printf("Pendiente cero.\n");
			endif
			grafica(1,k)=k;
			grafica(2,k)=r;
		endwhile
		printf("Iteraciones: %d\n", k);
		figure(1);
		plot(grafica(1,:), grafica(2,:), "r-o");xlabel("iter");ylabel("aprox");
		figure(2);
		hold on;
		intervalo=r-1:0.1:r+1;
		plot(intervalo, f(intervalo), "b");xlabel(num2str(r));ylabel("Y");
		plot(r,0, "k","markersize",10);xlabel(num2str(r));ylabel("Y");
	else
		r=false;
		printf("No se puede aplicar el metodo.\n");
	endif
endfunction
