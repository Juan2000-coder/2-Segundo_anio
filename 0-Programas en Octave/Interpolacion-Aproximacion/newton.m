## Da los coeficientes para la interpolaci�nc on polinomios de newton
function  [Y, coeficientes] = newton(puntos, X)
## VALORES DE SALIDA----------------------------------------------------------

	## Y: Son los valores del polinomio de interpolaci�n calculados para los
	## valores en X. (Ambos son vectores)
	
	## coeficientes: Son los coeficientes para la interpolaci�n con polinomios
	## de Newton
	
## VALORES DE ENTRADA------------------------------------------------------

	## puntos: Es una matriz de dos columnas. La primera contiene los valores
	## de x en los que la funci�n est� dada en forma discreta y la segunda
	## contiene las correspondientes im�genes.
	
	## X: Es un vector fila con los valores de  para los cuales se quieren las
	## im�genes del polinomio de interpolaci�n.
##-----------------------------------------------------------------------------

	x = puntos(:, 1);
	y = puntos(:, 2);
	
	## Cantidad de puntos para la interpolaci�n
	N = length(x);
	
	## Matriz triangular inferior para la interpolaci�n con m�todo de Newton
	A = ones(N);
	
	## Matriz rectangular para obtener los valores de Y con el polinomio de
	## interpolaci�n
	
	fi = ones(length(X), N);
	coeficientes = zeros(N, 1);
	coeficientes(1) = y(1);
	
	for j = 2:N
		
		## Armamos  y fi por columnas seg�n lo indica el m�todo de Newton.
		## Notar que convenientemente inicializamos la matriz A y fi como
		## matrices de 1
		
		A(:, j) = A(:, j - 1).*(x - x(j - 1));
		fi(:, j) = fi(:, j - 1).*(X - x(j - 1));
		coeficientes(j) = y(j) - A(j, 1:j - 1)*coeficientes(1: j - 1);
		coeficientes(j) /= A(j, j);
		
	endfor
	Y = fi*coeficientes;
endfunction