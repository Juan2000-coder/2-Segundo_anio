function [x, F] = difcen (x0, xN, dx, F0, dF0)
## VALORES DE SALIDA---------------------------------------------------------

	## x es el vector columna de puntos en el intervalo de integración
	
	## F es la matriz rectangular con tantas filas como componenentes de la
	## función vectorial y tantas columnas como puntos en el intervalo de
	## intergación
	
## VALORES DE ENTRADA--------------------------------------------------------

	## x0: es el primer punto en el intervalo de intergación
	## xN: es el último punto en el intervalo de intergación
	## dx: es el paso
	## F0: Son los valores iniciales de la función F
	## dF0: Son los valores iniciales de la derivada de la función F

	## A es la matriz que define el sistema (depende del valor de x)
	## F1 es una matriz diagonal correspondiente a las funciones que acompañan
	## a la derivada primera (depende de x en forma general)
	## C es el vector de términos independientes (depende de x en forma
	## general)

##----------------------------------------------------------------------------
	
	Fb = F0 - dF0*dx; ## Obtención de los valores atrás
	
	x = x0:dx:xN'; ## Definición del intervalo
	N = length(x); ## Cálculo de la cantidad de puntos
	
	D2 = cfd(2, 3, dx, 's')'; ## Columna de coeficientes derivada 2
	D1 = cfd(1, 3, dx, 's')'; ## Columna de coeficientes derivada 1

	F(:, 1) = F0; ## Valores iniciales
	
	for i = 1:N - 1
		AUX = [Fb, F(:,i)]; ## Valores atrás y actuales respectivamente
		DEN = inv(D2(3)*eye(length(F0)) + D1(3)*F1(x(i))); ## Denominador
		F(:, i + 1) = DEN*(C(x(i)) - A(x(i))*F(:, i) - AUX*D2(1:2) - F1(x(i))*(AUX*D1(1:2)));
		## Despeje
		Fb = F(:, i); ## Actualización
	endfor
endfunction
function A = A(x) 
	## Matriz para la combinación lineal de los valores de las
	## funciones del sistema (términos de orden 0)
	A = [1/4, 1/4;
		9/32, 0];
endfunction
function C = C(x)
	## vector columna de términos independientes
	C = [(5/10)*x; -3*(x^2)];
endfunction
function F1 = F1(x)
	## función vectorial que acompaña a los términos de derivada primera
endfunction