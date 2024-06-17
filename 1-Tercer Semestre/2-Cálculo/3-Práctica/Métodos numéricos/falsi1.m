
## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-13

function r = falsi1(f, a, b, Ef iter)
	k=0;flag=true;
	if ((abs(f(a))<=Ef)||(abs(f(b))<=Ef))
		printf("\nAl menos uno de los valores indicados se encuentra dentro de la tolerancia.\n");
		r=false;
	elseif (f(a)==f(b))||(f(a)*f(b)>=0)
		r=false;
		printf("\nNo se puede aplicar el metodo.\n");
	else
		while flag
			k++;
			m=(f(b)-f(a))/(b-a);
			r=a-(f(a)/m);
			if(f(r)*f(a)<=0)
				b=r;
			else
				a=r;
			endif
			if ((abs(f(r))<=Ef)||(k>=iter)||(f(a)==f(b)))
				flag=false;
			endif
			grafica(1,k)=l;
			grafica(2,k)=r;
			grafica(3,k)=f(r);
		endwhile
		printf("Numero de iteraciones: %d\n", k);
		if abs(f(r))<=Ef
			printf("\nAproximacion dentro de la tolerancia.\n");
		endif
		if f(a)==f(b)
			printf("\nNo se puede aplicar el metodo nuevamente.\n");
		endif
		figure(1);title("Aproximaciones");hold on; grid on;
		plot(grafica(1,:), grafica(2,:), "r-o");xlabel("iteraciones");ylabel("aproximaciones");
		figure(2);title("Imagenes");hold on; grid on;
		plot(grafica(1,:), grafica(3,:), "b"); xlabel("iteraciones");ylabel("imagenes");
	endif
endfunction