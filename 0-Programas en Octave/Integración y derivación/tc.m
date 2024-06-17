%TRAPECIOS COMPUESTO

%ES CONSISTENTE CON TRAPECIOS SIMPLES


function I = tc (puntos, h)
## VALORES DE SALIDA--------------------------------------------------------
	## I: Aproximaci�n de la intergal
## VALORES DE ENTRADA-------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x del intervalo de integraci�n discretizado y la segunda columna
	## tiene los valores de las im�genes correspondientes.
	
	## h: Es es valor del paso de los puntos.
#----------------------------------------------------------------------------

## podemos aceptar que el paso sea negativo siempre que trabajemos con
## consistencia. Aceptamos que x(1) es el extremo inferior de integraci�n y
## x(end) es el extremo superior y h, el menor paso, es igual a 
## [x(end)-x(1)]/[end-1]; Luego h puede ser positivo o negativo. Si el x(end)
## es mayor que x(1), entonces el paso es positivo, pero si ocurre lo opuesto
## entonces el paso es negativo, pero dado la convenci�n, seguimos calculando
## la integral que se pide que es aquella en que el extremo inferior es x(1) y
## el superior es x(end)

## En sintesis, que h tiene que ser pasada con signo y no con valor absoluto

## nos tenemos que asegurar de que el paso entre enteramente en el intervalo de 
## integraci�n, de modo que tengamos una cantidad natural de puntos en el arreglo
## para aplicar la regla de trapecios. Entrar� de forma entera en el intervalo
## ssi el cociente entre la longitud del intervalo y el paso es un numero
## entero, o sea que la divisi�n es entera y el resto es cero dicho de otra
## manera, el resto de la divisi�n es cero.
	
	x = puntos(:,1);
	y = puntos(:,2);
	n = length(x);
	
	if !mod(x(end) - x(1), h)
		
		## siempre que la divisi�n sea entera entramos, independientemente de
		## que el extremo de integraci�n inferior correspondientes a x(1) sea
		## mayor que el extremo de integraci�n superior correspondiente a x(end)
		
		n1 = int8((1 + (1/h)*(x(end) - x(1))));
		## es la cantidad de puntos a usar
		
		## Vector fila de coeficientes para la regla de integraci�n
		cf = ones(1, n1);
		cf(2:n1 - 1) = 2;
		
		d = (n - 1)/(n1 - 1); ## es la diferencia en la sucesi�n aritm�tica
		y1 = zeros(n1, 1);
		
		## Es el vector de los puntos que usaremos para el calculo de la
		## intergal correspondientes al paso h
		
		for i = 1:n1
			y1(i) = y(1 + d*(i - 1)); ## Es la regla de la sucesi�n aritm�tica
		endfor
		I = (h/2)*cf*y1;
	else
		## Entregamos un resultado l�gico negativo en caso de que el paso no
		## determine una cantidad entera de sub-intervalos en el intervalo
		## de inegraci�n
		I = false;
	endif
endfunction
