
function [Im, H, N, I] = romberg (puntos, metodo, tol)

## VALROES DE SALIDA--------------------------------------------------
	
	## Im es la aproximaci�n mejorada obtenida

	## H es el paso correspondiente a la aproximaci�n

	## N es el orden del error de la aproximaci�n mejorada
	
	## Las aproximaciones se guardan en la matriz I que se llena por
	## contradiagonales moviendonos por columnas
	
## VALORES DE ENTRADA-------------------------------------------------

	## Puntos es una matriz de dos columnas. En la primera est�n los valores
	## de x en el intervalo de integraci�n, equiespaciados, y en la segunda
	## los valores de las im�genes correspondientes.
	
	## M�todo es un car�cter que indica con cu�l de los dos m�todos conocidos
	## de integraci�n se va a aplicar el algoritmo de Romberg
	## M�todo: 't' es trapecios compuestos
	## M�todo: 's' es simpson compuestos
	
	## tol es una tolerancia que indica
	
	x = puntos(:, 1);
	p = length(x);
	
	
	if ((p >= 3)&&(metodo =='t'))||((p >= 5)&&(metodo == 's'))
		## Armamos la matriz por columnas, de modo que k es un �ndice de
		## columna
		
		flag = true;k = 0;
		
		## C�lculo del m�nimo paso. Es decir, de la distancia entre puntos
		## sucecivos en el intervalo de intergaci�n
		
		h = (x(end)-x(1))/(p-1);
		
		## En la primera columna en orden creciente de paso (*2) se colocan en
		## orden creciente de filas las aproximaciones que se obtienen
		## aplicando la regla de integraci�n correspondiente
		
		while flag
			k++;
			
			## La aproximaci�n se coloca en la posici�n i,j de la matriz
			
			## h1 corresponde al paso de la aproximaci�n con menor paso para
			## el c�lculo de la nueva aproximaci�n.
			
			## h2 corresponde al paso de la aproximaci�n con mayor paso para
			## el c�lculo de la nueva aproximaci�n.
			
			## Todas las aproximaciones en una misma contradiagonal
			## corresponden a un mismo paso. Al final de la contradiagonal
			## obtenemos la aproximaci�n en la posici�n 1,k y tiene el mismo
			## paso que la aproximaci�n en la posici�n k,1. La aproximaci�n
			## en esta �ltima posici�n tiene un paso hk = h*2^(k-1). Para el
			## c�clulo del elemento en la posici�n i,j en la contrdiagonal
			## correpondiente a hk, se tiene h1 = h_(k-1) = h*2^(k-2) y 
			## h2 = hk
			
			## Vemos entonces que los pasos a utilizar en la regla de
			## richardson solo dependen del n�mero de iteraci�n
			
			h1 = h*(2^(k-2));
			h2 = h*(2^(k-1));
			
			## Recorremos por columnas sobre la contradiagonal hasta la
			## columna k (la suma es i + j = k + 1)
			
			for j = 1:k
				
				## Aplicamos extrapolaci�n de Richarson para llenar las
				## posiciones en las columnas mayores a 1 y aplicamos el
				## m�todo de integraci�n correspondiente para llenar las
				## posiciones en la primera columna
				
				if j != 1
					## Se obtiene despejando de la relaci�n de +indices de
					## la contradiagonal
					
					i = (k + 1) - j;
					
					switch metodo
						## n1 y n2 son los ordenes de error de las
						## aproximaciones. Las aproximaciones en una
						## misma columna tienen el mismo orden de
						## error.
						case 't'
							## El orden de error para trapecios
							## compuesto es de 2. Por cada columna el
							## orden de error aumenta en dos
							## (extrapolaci�n de Richardson)
							
							n1 = n2 = 2 + 2*(j-2);
							
							## Son los ordenes de error de las
							## aproximaciones en la columna anterior
							
					case 's'
							## El orden de error para simpson
							## compuesto es de 4. Por cada columna el
							## orden de error aumenta en dos
							## (extrapolaci�n de Richardson)
							
							n1 = n2 = 4 + 2*(j - 2);
							
							## Son los ordenes de error de las
							## aproximaciones en la columna anterior
					endswitch
					
					## i1 e i2 son las aproximaciones en la columna
					## anterior en las filas i e +1 con las cuales se va a
					## aplicar la regla
					
					i1 = I(i, j - 1);
					i2 = I(i + 1, j -1);
					
					I(i, j) = richardson (i1, h1, n1, i2, h2, n2);
					
					## En este caso no nos interesan los otros dos valores
					## que devuelve la funci�n que ejecuta extrapolaci�n
					## de Richardson, ya que el n�mero de columna y la
					## suma de los valores en al contradiagonal
					## los valores del paso y del orden de error.
				else
					switch metodo
						
						## Se aplican los m�todos para llenar las
						## posiciones en le primera columna
						
						case 't'
							aux = tc(puntos, h2);
						case 's'
							aux = sc(puntos, h2);
					endswitch
					
					## Las funciones que realizan los m�todos devuelven un
					## valor num�rico (la aproximaci�n) o un valor l�gico
					## en caso de que no se pudiera aplicar el m�todo
					
					if !islogical(aux)
						I(k, 1) = aux;
					else
						## Si no se pudo aplicar el m�todo rompemos el
						## algoritmo e indicamos la raz�n con el valor de
						## flag 1
						
						flag = false;
						flag1 = 1;
						break;
					endif
				endif
			endfor
			
			if (k != 1) && flag
				
				## Verificamos el error de la aproximaci�n solo en caso de
				## que no haya existido alg�n error y no se trate de una
				## aproximacion en la primera columna
				
				err = abs(I(1, k) - I(1, k-1))/abs(I(1, k));
				
				## Calculamos el error relativo como el valor relativo a la mejor
				## aproximaci�n de la iteraci�n k (la aproximaci�n en la
				## columna k de la fila 1) de la diferencia entre las
				## mejores aproximaciones de la iteraci�n k
				
				if err <= tol
					flag = false;
					flag1 = 2;
				endif
			endif
		endwhile
		
		switch flag1
			case 1
				
				## Si el algoritmo termina por un error en la aplicaci�n
				## del m�todo de integracion, la aproximaci�n mejorada es
				## la que se encuentra en la columna anterior a k en la
				## fila 1 (La mejor obtenida antes del error). 
				
				## (El error en la aplicaci�n del m�todo se debe
				## en general a que el paso ya es tan grande que no
				## determina una cantidad entera de intervalos en el
				## intervalo de intergaci�n)
				
				Im = I(1, k-1);
				H = h1;
				
				switch metodo
					case 't'
						N = 2 + 2*(k - 2);
					case 's'
						N = 4 + 2*(k - 2);
				endswitch
			case 2
				
				## Si no sale por un error en la aplicaci�n del m�todo,
				## entonces la aproximaci�n mejorada es la obtenida al
				## final de la iteraci�n, que se ubica en la primera fila
				## en la columna k
				
				Im = I(1, k); H = h2;
				switch metodo
					case 't'
						N = 2 + 2*(k - 1);
					case 's'
						N = 4 + 2*(k - 1);
				endswitch
		endswitch
	else
		## Es necesario para aplicar el m�todo de Romberg a partir de
		## trapecios compuestos que al menos hayan 3 puntos, sino estar�amos
		## hablando de una �nica aplicaci�n de trapecios simples
		
		## Es necesario para la aplicaci�n del m�todo de Romberg a partir de
		## simpson compuestos que al menos hayan 5 puntos, sino estar�amos
		## hablando de una �nica aplicaci�n de simpson simple
		
		printf("\No se puede aplicar el algoritmo de Romberg.\n");
	endif
endfunction