
function [cf,k]= cfd (orden, N, h,tipo)
	tol=1e-12;
	%tipo af:asimetric-forward;ab: asimetric-backwards;s:simétric
	%oden de la derivada; N numero de puntos; tipo: simetrica o asimétrica
	%si es asimétrica vamos a considerar que se trata hacia adelante o hacia atrás
	
	%los coeficientes se devuelven en el orden creciente de n
	%osea primero se dan los coeficientes correspondientes a los polinomion con n negativo
	%y aumentando
	
	if (N > orden)&&(mod(N,2) == 0||mod(N,2) == 1)&&(mod(orden,2) == 0||mod(orden,2) == 1)
		switch tipo
			case 's'
				if mod(N,2)==1
					## derivada simétrica pedimos una cantidad impr de
					## puntos ya que tenemos puntos medio
					
					## Obtención de los valores de n para cada puntos.
					
					## En este caso el punto pivote corresponde a la
					## columna central de la matriz del sistema, a la
					## derecha las columnas corresponden a valores
					## positivos de n y a la izquierda corresponden a
					## valores negativos de n
					
					n = (1-N)/2:(N-1)/2;
				else
					printf("\nPara la derivada simétrica indicar una cantidad impar de puntos.\n");
				endif
			case 'af'
				## Derivada asimétrica hacia adelante forward
				
				## En este caso el punto de pivote se corresponde con la
				## primera columna de la matriz del sistema y las columnas
				## derechas corresponden a valores positivos de n
				
				n = 0:N-1;
			case 'ab'
				## derivada asimétrica hacia atrás backwards
				
				## En este caso el puntos de pivote corresponde a la última
				## columa de la matriz del sistema y las columnas a la
				## izquierda corresponden a valores negativos de n
				
				n = 1-N:0;
		endswitch
		
		## Formación de la matriz del sistema por filas
		for i = 0:N-1
			
			A(i + 1,:) = n.^i;
		endfor
		
		## Cálculo de los coeficientes para la derivada
		
		## Solo se conserva la columna correspondiente al orden mas 1 de la
		## inversa de la matriz del sistema. Lo cual es evidente ya que el
		## término independiente del sistema es la columna orden + 1 de la
		## matriz identidad de oorden N
		
		cf = inv(A)(:, orden + 1);
		
		## Verificamos el orden de la regla evaluando los coeficientes de los
		## términos de orden superior a N-1 en la seríe de Taylor que resulta
		## de aplicar la combinación lineal
		
		do 
			i++;
		until abs((n.^i)*cf) > tol;
		
		## debería ser cero, pero en ocasiones,
		## resultados que deberían dar cero no dan y por eso ponemos una
		## tolerancia no nula
		
		##orden del error
		k = i-orden;
		## Esto se obtiene luego de multiplicar ambos miembros por el paso
		## elevado a la -orden.
		
		## calculo de los coeficientes. Se obtiene despejando de la serie de
		## Taylor
		cf = (1/(h^orden))*factorial(orden)*cf;
		
		cf = cf'; ## La devolvemos como matriz fila
	else
		## Se mete aca si no se verifica que el orden y la cantidad de puntos
		## sean números enteros o si no se verifica que la cantidad de puntos
		## requeridos sean al menos iguales en cantidad al orden de la
		## derivada
		
		cf = false;
		printf("\nerror.\n");
	endif
endfunction
