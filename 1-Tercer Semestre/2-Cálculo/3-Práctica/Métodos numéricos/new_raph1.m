## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-14

function r = new_raph1(a, f, df, Ef, iter)
	clc;k=0;flag=true;
	if abs(f(a))<Ef
		printf("\nEl valor indicado esta dentro de la tolerancia.\n");
		r=false;
	elseif df(a)==0
		printf("\nNo se puede aplicar el metodo.\n");r=false;
	else
		r=a;
		while flag 
			k++;
			r-=(f(r)/df(r));
			if ((abs(f(r))<=Ef)||(k>=iter)||(df(r)==0))
				flag=false;
			endif
			grafica(1,k)=k;
			grafica(2,k)=r;
			grafica(3,k)=f(r);
		endwhile
		printf("Numro de iteraciones:%d", k);
		if abs(f(r))<=Ef
			printf("Aproximacion dentro de la tolerancia.\n");
		elseif df(r)==0
			printf("No es posible continuar aplicando el metodo.\n");
		endif
		figure(1);title("Aproximaciones");hold on; grid on;
		plot(grafica(1,:), grafica(2,:), "r-o");grid on; xlabel("iteraciones");ylabel("aproximaciones");
		figure(2);title("imagenes aproximaciones");hold on; grid on;
		plot(grafica(1,:), grafica(3,:), "b");grid on; xlabel("iteraciones");ylabel("imagenes");
	endif
endfunction
