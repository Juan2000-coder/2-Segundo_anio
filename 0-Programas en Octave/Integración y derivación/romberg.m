
function [Im, H, N, I] = romberg (puntos, metodo, tol)

## VALROES DE SALIDA--------------------------------------------------
	
	## Im es la aproximación mejorada obtenida

	## H es el paso correspondiente a la aproximación

	## N es el orden del error de la aproximación mejorada
	
	## Las aproximaciones se guardan en la matriz I que se llena por
	## contradiagonales moviendonos por columnas
	
## VALORES DE ENTRADA-------------------------------------------------

	## Puntos es una matriz de dos columnas. En la primera están los valores
	## de x en el intervalo de integración, equiespaciados, y en la segunda
	## los valores de las imágenes correspondientes.
	
	## Método es un carácter que indica con cuál de los dos métodos conocidos
	## de integración se va a aplicar el algoritmo de Romberg
	## Método: 't' es trapecios compuestos
	## Método: 's' es simpson compuestos
	
	## tol es una tolerancia que indica
	
	x = puntos(:, 1);
	p = length(x);
	
	
	if ((p >= 3)&&(metodo =='t'))||((p >= 5)&&(metodo == 's'))
		## Armamos la matriz por columnas, de modo que k es un índice de
		## columna
		
		flag = true;k = 0;
		
		## Cálculo del mínimo paso. Es decir, de la distancia entre puntos
		## sucecivos en el intervalo de intergación
		
		h = (x(end)-x(1))/(p-1);
		
		## En la primera columna en orden creciente de paso (*2) se colocan en
		## orden creciente de filas las aproximaciones que se obtienen
		## aplicando la regla de integración correspondiente
		
		while flag
			k++;
			
			## La aproximación se coloca en la posición i,j de la matriz
			
			## h1 corresponde al paso de la aproximación con menor paso para
			## el cálculo de la nueva aproximación.
			
			## h2 corresponde al paso de la aproximación con mayor paso para
			## el cálculo de la nueva aproximación.
			
			## Todas las aproximaciones en una misma contradiagonal
			## corresponden a un mismo paso. Al final de la contradiagonal
			## obtenemos la aproximación en la posición 1,k y tiene el mismo
			## paso que la aproximación en la posición k,1. La aproximación
			## en esta última posición tiene un paso hk = h*2^(k-1). Para el
			## cáclulo del elemento en la posición i,j en la contrdiagonal
			## correpondiente a hk, se tiene h1 = h_(k-1) = h*2^(k-2) y 
			## h2 = hk
			
			## Vemos entonces que los pasos a utilizar en la regla de
			## richardson solo dependen del número de iteración
			
			h1 = h*(2^(k-2));
			h2 = h*(2^(k-1));
			
			## Recorremos por columnas sobre la contradiagonal hasta la
			## columna k (la suma es i + j = k + 1)
			
			for j = 1:k
				
				## Aplicamos extrapolación de Richarson para llenar las
				## posiciones en las columnas mayores a 1 y aplicamos el
				## método de integración correspondiente para llenar las
				## posiciones en la primera columna
				
				if j != 1
					## Se obtiene despejando de la relación de +indices de
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
							## (extrapolación de Richardson)
							
							n1 = n2 = 2 + 2*(j-2);
							
							## Son los ordenes de error de las
							## aproximaciones en la columna anterior
							
					case 's'
							## El orden de error para simpson
							## compuesto es de 4. Por cada columna el
							## orden de error aumenta en dos
							## (extrapolación de Richardson)
							
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
					## que devuelve la función que ejecuta extrapolación
					## de Richardson, ya que el número de columna y la
					## suma de los valores en al contradiagonal
					## los valores del paso y del orden de error.
				else
					switch metodo
						
						## Se aplican los métodos para llenar las
						## posiciones en le primera columna
						
						case 't'
							aux = tc(puntos, h2);
						case 's'
							aux = sc(puntos, h2);
					endswitch
					
					## Las funciones que realizan los métodos devuelven un
					## valor numérico (la aproximación) o un valor lógico
					## en caso de que no se pudiera aplicar el método
					
					if !islogical(aux)
						I(k, 1) = aux;
					else
						## Si no se pudo aplicar el método rompemos el
						## algoritmo e indicamos la razón con el valor de
						## flag 1
						
						flag = false;
						flag1 = 1;
						break;
					endif
				endif
			endfor
			
			if (k != 1) && flag
				
				## Verificamos el error de la aproximación solo en caso de
				## que no haya existido algún error y no se trate de una
				## aproximacion en la primera columna
				
				err = abs(I(1, k) - I(1, k-1))/abs(I(1, k));
				
				## Calculamos el error relativo como el valor relativo a la mejor
				## aproximación de la iteración k (la aproximación en la
				## columna k de la fila 1) de la diferencia entre las
				## mejores aproximaciones de la iteración k
				
				if err <= tol
					flag = false;
					flag1 = 2;
				endif
			endif
		endwhile
		
		switch flag1
			case 1
				
				## Si el algoritmo termina por un error en la aplicación
				## del método de integracion, la aproximación mejorada es
				## la que se encuentra en la columna anterior a k en la
				## fila 1 (La mejor obtenida antes del error). 
				
				## (El error en la aplicación del método se debe
				## en general a que el paso ya es tan grande que no
				## determina una cantidad entera de intervalos en el
				## intervalo de intergación)
				
				Im = I(1, k-1);
				H = h1;
				
				switch metodo
					case 't'
						N = 2 + 2*(k - 2);
					case 's'
						N = 4 + 2*(k - 2);
				endswitch
			case 2
				
				## Si no sale por un error en la aplicación del método,
				## entonces la aproximación mejorada es la obtenida al
				## final de la iteración, que se ubica en la primera fila
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
		## Es necesario para aplicar el método de Romberg a partir de
		## trapecios compuestos que al menos hayan 3 puntos, sino estaríamos
		## hablando de una única aplicación de trapecios simples
		
		## Es necesario para la aplicación del método de Romberg a partir de
		## simpson compuestos que al menos hayan 5 puntos, sino estaríamos
		## hablando de una única aplicación de simpson simple
		
		printf("\No se puede aplicar el algoritmo de Romberg.\n");
	endif
endfunction