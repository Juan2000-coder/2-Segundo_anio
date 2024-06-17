function P = lagrange (puntos, X)
## VALORES DE SALIDA----------------------------------------------------------

	## P: Son los valores del polinomio de interpolación calculados para los
	## valores en X. (Ambos son vectores)
	
## VALORES DE ENTRADA------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x en los que la función está dada en forma discreta y la segunda
	## contiene las correspondientes imágenes.
	
	## X: Es un vector fila con los valores de  para los cuales se quieren las
	## imágenes del polinomio de interpolación.
##-----------------------------------------------------------------------------
	x = puntos(:, 1);
	y = puntos(:, 2);
	P = zeros(length(X), 1);
	
	## Los valores de i son índices de los polinomios de lagrange
	## Hay tantos polinomios de Lagrange como puntos para la interpolación
	
	for i = 1:length(x)
		
		## Creamos pimero un vector columna con los valores las imágenes
		
		aux = y(i)*ones(length(X), 1);
		
		## El índdice j es el índice de los factores o de las raíces en cada
		## polinomio de lagrange. Hay tantos como puntos menor uno por cada
		## polinomio
		
		for j = 1:length(x)
			if i != j
				aux = aux.*((X - x(j))/(x(i) - x(j)));
			endif
		endfor
		P += aux;
	endfor
endfunction
