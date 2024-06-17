
function x = biseccion (a, b, f, tol, iteraciones)
## VALORES DE SALIDA-----------------------------------------------------------
	## x: es la ra�z
## VALORES DE ENTRADA---------------------------------------------------------
	## a: es el extremo derecho del intervalo
	## b: es el extremo izquierdo del intervalo
	## f: es un puntero a la funci�n
	## tol: es la tolerancia o precisi�n requerida
	## iteraciones: es el m�ximo de iteraciones admitidas
##---------------------------------------------------------------------------

	x = i = 0;
	
	## Gr�fico de la funci�n en el intervalo dado--------------------------
	figure (1); title("grafica en [a, b]"); hold on; grid on;
	intervalo = a:0.1:b;
	plot (intervalo, f(intervalo), "b"); xlabel("x"); ylabel("y");
	##--------------------------------------------------------------------
	
## Condici�n de inicializaci�n
	if (f(a)*f(b)) < 0
		
		if(abs(f(a)) < tol)&&(abs(f(b)) < tol)
			x = [a, b];
		elseif (abs(f(a)) < tol)&&(abs(f(b)) > tol)
			x = a;
		elseif (abs(f(b)) < tol)&&(abs(f(a)) > tol)
			x = b;
		else	
			aprox = x = a;
			while(abs(f(aprox)) > tol)&&(i < iteraciones)
				i++;
				x = (a + b)/2;
				if abs(f(x)) < abs(f(aprox))
					aprox = x;
				endif
				if((f(x)*f(a)) < 0)
					b = x;
				else
					a = x;
				endif
				
				## Gr�fica es una m�triz cuadrada con dos filas para el
				## gr�fico de las aproximaciones
				
				grafica(1, i) = i;
				grafica(2, i) = x;
			endwhile
			x = aprox;
			if abs(f(aprox)) < tol
				printf("Aproximacion dentro de la tolerancia.\n");
			endif
			
			## Gr�fica de las aproximaciones
			
			printf("Iteraciones: %d\n", i);
			figure (2); title("Aproximaciones"); hold on; grid on;
			plot(grafica(1, :), grafica(2, :), "r-o"); xlabel("iteraciones"); ylabel("aproximaciones");
		endif
	elseif (abs(f(a)) < tol)&&(abs(f(b)) < tol)
		x = [a, b];
	elseif (abs(f(a)) < tol)&&(abs(f(b)) > tol)
		x = a;
	elseif (abs(f(b)) < tol)&&(abs(f(a)) > tol)
		x = b;
	else
		printf("No se puede aplicar el metodo.\n");
		x = false;
	endif
endfunction
