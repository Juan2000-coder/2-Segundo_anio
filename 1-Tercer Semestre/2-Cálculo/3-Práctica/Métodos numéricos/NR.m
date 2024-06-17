%Newton Raphson%

function r = NR(r0,f,tol,maxiter)
	k=0;flag=true;[y,dy]=f(r0);r=r0;
	if abs(y)<=tol
		flag=false;
	endif
	if dy==0
		flag=false;
		printf("Derivada nula.\n");
	endif
	while flag
		k++;
		[y,dy]=f(r);
		r-=(y/dy);
		err=abs(f(r));
		if err<=tol
			flag=0;
			printf("Aproximacion dentro de la tolerancia.\n");
		endif
		if k>=maxiter
			flag=0;
		endif
		if  dy==0
			flag=0;
			printf("Derivada nula.\n");
		endif
		imagenes(1,k)=k;
		imagenes(2,k)=r;
	endwhile
	printf("Numero de iteraciones: %d\n", k);
	figure(1)
	title("Aproximaciones");hold on;grid on;
	plot(imagenes(1,:),imagenes(2,:),".--r","markersize",10); xlabel("iteraciones");ylabel("aproximaciones");
	figure(2);
	title("Grafica alrededor de la raiz")
	hold on; grid on;
	intervalo=r-1:0.1:r+1;
	plot(intervalo,f(intervalo), "b");xlabel("x");ylabel("y");
	plot(r, f(r), "k", "markersize",10);
endfunction
