%simpsoncompuesto
function I = sc(puntos, h)
## VALORES DE SALIDA--------------------------------------------------------

	## I: Es la aproximaci�n de la intergal
	
## VALORES DE ENTRADA------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x del intervalo de integraci�n discretizado y la segunda columna
	## tiene los valores de las im�genes correspondientes.
	
	## h: Es es valor del paso de los puntos.
##--------------------------------------------------------------------------
	
	x = puntos(:, 1);
	y = puntos(:, 2);
	n = length(x);
	
	if mod(n, 2)
		
		## Entramos al m�todo solo en caso de que la cantidad de puntos sea
		## impar (condici�n para el m�todo). (Es en realidad una
		## simplificaci�n, pero cuando necesitemos algo mas completo
		## modificamos el algoritmo)
		
		n1 = 1 + (1/h)*(x(end) - x(1)); 
		##cantidad de puntos para la aproximaci�n
		
		
		if mod(n1, 2) == 1
			## entramos solo si el paso entra enteramente en el intervalo
			## y si la cantidad de puntos n1 determinada con el paso es impar
			## la condici�n abarca ambos casos, si no endtra enteramente, entonces
			## es imposible que el modulo sea 1
			
			
			cf = ones(1, n1); ##vector fila de coeficientes para el m�todo
			
			##vector columna con los valores de y que se utilizaran en el
			## m�todo
			y1 = zeros(n1, 1);
			
			## Diferencia de la sucesi�n aritm�tica para encontrar los
			## valores de las im�genes que se van a utilizaran
			d = (n - 1)/(n1 - 1);
			
			for i = 1:n1
				
				## No se llenan los valores extremos de la fila de
				## coeficientes ya que estos valores ya fueron asignados en
				## la declaraci�n de la variable
				
				if (i != 1)&&(i != n1)
					if mod(i, 2)
						cf(i) = 2;%impares
					else
						cf(i) = 4;%pares
					endif
				endif
				
				## Aplicaci�n de la sucesi�n aritm�tica
				y1(i) = y(1 + d*(i - 1));
			endfor
			I = (h/3)*cf*y1;
		else
			## Si el paso no determina una cantidad impar de puntos, no es
			## posible aplicar el m�todo
			I = false;
		endif
	else
		## Si la cantida de puntos entrgados no e simpar tal vez se pueda a�n
		## aplicar el m�todo pero no consideramos esa posibilidad
		
		I = false;
	endif
endfunction
