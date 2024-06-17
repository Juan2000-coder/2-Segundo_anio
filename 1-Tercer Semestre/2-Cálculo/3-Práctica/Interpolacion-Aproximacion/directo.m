function [Y, coeficientes] = directo(puntos, X)
## VALORES DE SALIDA----------------------------------------------------------

	## Y: Son los valores del polinomio de interpolaci�n calculados para los
	## valores en X. (Ambos son vectores)
	
	## coeficientes: Son los coeficientes para la interpolaci�n con polinomios
	## elementales
	
## VALORES DE ENTRADA------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x en los que la funci�n est� dada en forma discreta y la segunda
	## contiene las correspondientes im�genes.
	
	## X: Es un vector fila con los valores de  para los cuales se quieren las
	## im�genes del polinomio de interpolaci�n.
##-----------------------------------------------------------------------------
	x = puntos(:, 1);
	y = puntos(:, 2);
	N = length(x);
	for j = 1:N
		A(:, j) = x.^(j - 1);
	endfor
	coeficientes = inv(A)*y;
	for j = 1:N
		fi(:, j) = X.^(j - 1);
	endfor
	Y = fi*coeficientes;
endfunction