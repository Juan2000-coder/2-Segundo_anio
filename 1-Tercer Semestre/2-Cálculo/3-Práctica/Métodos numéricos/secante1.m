## Author: Juan <Juan@JUAN_PORTÁTIL>
## Created: 2021-04-09

function ret_val = secante1(f, a, b, Ef, Ei,iter)
	clc;flag=true;k=0;x=0;ret_val=0;
	if ((abs(f(a))<=Ef)||(abs(f(b))<=Ef))
		printf("\nAl menos uno de los valores indicados se encuentra dentro de la tolerancia.\n");
		ret_val=false;
	elseif abs(a-b)<=Ei
		ret_val=false;
		printf("\nLa longitud del intervalo esta dentro de la tolerancia.\n");
	elseif f(a)==f(b)
		ret_val=false;
		printf("\nLa funcion tiene el mismo valor en los punto, no se puede aplicar el metodo.\n");
	else
		if abs(f(a))<abs(f(b))
			x=a;prev=b;
		else
			x=b;prev=a;
		endif
		aprox=0;n=0;imagenes=0;
		while(flag)
			k++;
			m = (f(x)-f(prev))/(x-prev);
			aux = x-(f(x)/m);%%tenemos problemas si el valor calculado no es del dominio
			if (abs(f(aux))<abs(f(x)))
				prev=x;
				x=aux;
			else
				prev=aux;
			endif
			aprox(k)=x;n(k)=k;imagenes(k)=f(x);
			if ((abs(f(x))<=Ef)||(k>=iter)||(abs(x-prev)<=Ei)||(f(x)==f(prev)))
				flag=false;
			endif
		endwhile
		if abs(f(x))<=Ef
			printf("\nAproximacion dentro de la tolerancia.\n");
		endif
		if k>=iter
			printf("\nLimite de iteraciones alcanzado.\n");
		endif
		if abs(x-prev)<=Ei
			printf("Longitud del intervalo dentro de la tolerancia.\n");
		endif
		if f(x)==f(prev)
			printf("\nNo se puede aplicar el metodo nuevamente.\n");
		endif
		ret_val=[n;aprox;imagenes];
		figure(1);
		plot(n, aprox, "r");grid on; xlabel("iteraciones");ylabel("aproximaciones");
		figure(2);
		plot(n, imagenes, "b");grid on; xlabel("iteraciones");ylabel("imagenes");
		figure(3);
		plot(aprox, imagenes, "o");grid on; xlabel("aproximaciones");ylabel("imagenes");
	endif
endfunction