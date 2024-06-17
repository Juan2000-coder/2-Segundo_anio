## Ese programa permite resolver en forma general una ecuaci�n diferencial
## ordinaria de orden 2 con valores en la frontera.

function [A, B] = dif2 (x1, xN, h, f2, f1, f0, f, C)
	
## VALORES DE SALIDA---------------------------------------------------------

	## A: Es la matriz del sistema sin los coeficientes correspondientes a las
	## ecuaciones que dan las condiciones de la frontera. La matriz A se
	## devuelve con la primera y �ltima fila nula para completarlas con los
	## coeficientes de estas ecuaciones. La primera corresponde a la condici�n
	## en el punto X1 y la �ltima con la condici�n en el punto Xn
	
	## B: Es la matriz de t�rminos independientes del sistema. El primer y
	## �ltimo elemento son nulos y deben llenarse con los t�rminos
	## independientes correspondientes a las condiciones de frontera. El
	## primer elemento es el que corresponde a la condici�n en x1 y el
	## �ltimo elemento corresponde a la condici�n en xN

## VALORES DE ENTRADA---------------------------------------------------------
	
	## f2, f1, f0, f, C son las funciones coeficientes de la ecuaci�n diferencial,
	## el indice indica el orden de la derivada que acompa�a la funci�n
	## esas funciones est�n vectorizadas y son punteros
	
	## X1: es el extremo izquierdo del intervalo de intergraci�n
	## XN: es el extremo derecho del intervalo de integraci�n
	## h: es el paso
	
	## f es una funci�n de x dada en forma discreta
	## si se indica un solo n�mero, se interpreta como un coeficiente de las x
	
##----------------------------------------------------------------------------

	N = 1 + (xN - x1)/h; ## cantidad de puntos
	x = x1:h:xN'; ##discretizaci�n del intervalo

	L2 = cfd(2, 3, h, 's');
	L1 = cfd(1, 3, h, 's');
	
	## Calculo de la fila de coeficientes para las derivadas primera y segunda
	## con 3 puntos un paso h ambas sim�trica 's'
	
	## Declaraci�n de las matrices cuadradas que tiene los coeficientes para
	## aplicar las derivadas de forma matricial y los coeficientes para operar
	## de forma matricial. D son para las derivadas y A son de coeficientes
	
	A = A2 = A1 = A0 = D2 = D1 = zeros(N);
	
	a2 = f2(x); 
	a1 = f1(x);
	a0 = f0(x);
	b = f(x);
	
	## calculo de los vectores de coeficientes y t�rminos independiente en la
	## ecuaci�n diferencial.
	
	## La primera y �ltima fila las dejamos con ceros

	for i = 2:N - 1
		
		## Armamos las matrices. Las de coeficientes son naturalmente
		## diagonales mientras que las de derivaci�n se arman por filas con
		## los correspondientes coeficientes de las reglas de derivaci�n
		
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
	
	B = C - b; ## Vector de t�rminos independientes
	B(1) = 0; 
	B(end) = 0; 
	## Se anulan el primer y �ltimo elementoo correspondientes a las
	## condiciones de frontera
	
endfunction
