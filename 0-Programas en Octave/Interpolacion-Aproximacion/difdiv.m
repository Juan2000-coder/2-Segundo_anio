
function D = difdiv (puntos)
	x = puntos(:, 1);
	y = puntos(:, 2);
	n = length(x);
	
	%con n+1 puntos tenemos diferencias divididas hasta de orden n
	%con n puntos tenemos diferencias divididas de hasta orden n-1
	%con n puntos tenemos n-1 diferencias divididas de orden 1
	%n-2 divididas de orden 2, n-3 de orden 3,..., 1 de orden n-1
	
	%Si ordenamos las diferencias en una matriz, esta será una triángular inferior
	%o triangular superior de orden n-1 por n-1
	
	%nosotros lo vamos a ordenas en una triangular superior
	
	%luego al menos necesitamos 2 puntos
	D = zeros(n);
	D(:, 1) = y; %(n diferencias de orden 0)
	for j = 2:n
		%el numero de columna da el orden de la diferencia mas uno
		%vamos a hacerlo mas explicito
		orden = j - 1;
		for i = 1:n - orden 
			%1:n-(j-1) =1:n-(orden de la diferencia)//que es lo que planteamos
			%arriba en la fila 9
			
			%recorremos hasta donde se pueden calcular diferencias divididas
			%y el resto de la columna queda con ceros
			D(i, j) = (D(i + 1, j - 1) - D(i, j - 1))/(x(i + orden) - x(i));
			%tenemos que avanzar tantos lugares en x como el orden de la diferencia
		endfor
	endfor
	%Los elementos en la primera fila contiene todos los coeficientes para la
	%interpolación con polinomios de newton
endfunction
