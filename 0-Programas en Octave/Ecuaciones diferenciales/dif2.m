## Ese programa permite resolver en forma general una ecuación diferencial
## ordinaria de orden 2 con valores en la frontera.

function [A, B] = dif2 (x1, xN, h, f2, f1, f0, f, C)
	
## VALORES DE SALIDA---------------------------------------------------------

	## A: Es la matriz del sistema sin los coeficientes correspondientes a las
	## ecuaciones que dan las condiciones de la frontera. La matriz A se
	## devuelve con la primera y última fila nula para completarlas con los
	## coeficientes de estas ecuaciones. La primera corresponde a la condición
	## en el punto X1 y la última con la condición en el punto Xn
	
	## B: Es la matriz de términos independientes del sistema. El primer y
	## último elemento son nulos y deben llenarse con los términos
	## independientes correspondientes a las condiciones de frontera. El
	## primer elemento es el que corresponde a la condición en x1 y el
	## último elemento corresponde a la condición en xN

## VALORES DE ENTRADA---------------------------------------------------------
	
	## f2, f1, f0, f, C son las funciones coeficientes de la ecuación diferencial,
	## el indice indica el orden de la derivada que acompaña la función
	## esas funciones están vectorizadas y son punteros
	
	## X1: es el extremo izquierdo del intervalo de intergración
	## XN: es el extremo derecho del intervalo de integración
	## h: es el paso
	
	## f es una función de x dada en forma discreta
	## si se indica un solo número, se interpreta como un coeficiente de las x
	
##----------------------------------------------------------------------------

	N = 1 + (xN - x1)/h; ## cantidad de puntos
	x = x1:h:xN'; ##discretización del intervalo

	L2 = cfd(2, 3, h, 's');
	L1 = cfd(1, 3, h, 's');
	
	## Calculo de la fila de coeficientes para las derivadas primera y segunda
	## con 3 puntos un paso h ambas simétrica 's'
	
	## Declaración de las matrices cuadradas que tiene los coeficientes para
	## aplicar las derivadas de forma matricial y los coeficientes para operar
	## de forma matricial. D son para las derivadas y A son de coeficientes
	
	A = A2 = A1 = A0 = D2 = D1 = zeros(N);
	
	a2 = f2(x); 
	a1 = f1(x);
	a0 = f0(x);
	b = f(x);
	
	## calculo de los vectores de coeficientes y términos independiente en la
	## ecuación diferencial.
	
	## La primera y última fila las dejamos con ceros

	for i = 2:N - 1
		
		## Armamos las matrices. Las de coeficientes son naturalmente
		## diagonales mientras que las de derivación se arman por filas con
		## los correspondientes coeficientes de las reglas de derivación
		
		A2(i, i) = a2(i);
		A1(i, i) = a1(i);
		A0(i, i) = a0(i);
		D2(i, i - 1:i + 1) = L2;
		D1(i, i - 1:i + 1) = L1;
	endfor
	
	## Armado de la matriz del sistema
	A += (A2*D2 + A1*D1 + A0);

	## Observar que quedan dos filas nulas, las correspondientes a las
	## condiciones de frontera  arriba y abajo de la matriz. Las cuales deben
	## ser llenadas una vez devuelta la matriz del sistema.
	
	B = C - b; ## Vector de términos independientes
	B(1) = 0; 
	B(end) = 0; 
	## Se anulan el primer y último elementoo correspondientes a las
	## condiciones de frontera
	
endfunction
