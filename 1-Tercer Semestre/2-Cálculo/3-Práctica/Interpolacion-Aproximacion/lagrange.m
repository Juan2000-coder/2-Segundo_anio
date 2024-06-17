function P = lagrange (puntos, X)
## VALORES DE SALIDA----------------------------------------------------------

	## P: Son los valores del polinomio de interpolaci�n calculados para los
	## valores en X. (Ambos son vectores)
	
## VALORES DE ENTRADA------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x en los que la funci�n est� dada en forma discreta y la segunda
	## contiene las correspondientes im�genes.
	
	## X: Es un vector fila con los valores de  para los cuales se quieren las
	## im�genes del polinomio de interpolaci�n.
##-----------------------------------------------------------------------------
	x = puntos(:, 1);
	y = puntos(:, 2);
	P = zeros(length(X), 1);
	
	## Los valores de i son �ndices de los polinomios de lagrange
	## Hay tantos polinomios de Lagrange como puntos para la interpolaci�n
	
	for i = 1:length(x)
		
		## Creamos pimero un vector columna con los valores las im�genes
		
		aux = y(i)*ones(length(X), 1);
		
		## El �nddice j es el �ndice de los factores o de las ra�ces en cada
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
