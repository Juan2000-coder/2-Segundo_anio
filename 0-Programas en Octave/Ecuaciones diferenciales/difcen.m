function [x, F] = difcen (x0, xN, dx, F0, dF0)
## VALORES DE SALIDA---------------------------------------------------------

	## x es el vector columna de puntos en el intervalo de integraci�n
	
	## F es la matriz rectangular con tantas filas como componenentes de la
	## funci�n vectorial y tantas columnas como puntos en el intervalo de
	## intergaci�n
	
## VALORES DE ENTRADA--------------------------------------------------------

	## x0: es el primer punto en el intervalo de intergaci�n
	## xN: es el �ltimo punto en el intervalo de intergaci�n
	## dx: es el paso
	## F0: Son los valores iniciales de la funci�n F
	## dF0: Son los valores iniciales de la derivada de la funci�n F

	## A es la matriz que define el sistema (depende del valor de x)
	## F1 es una matriz diagonal correspondiente a las funciones que acompa�an
	## a la derivada primera (depende de x en forma general)
	## C es el vector de t�rminos independientes (depende de x en forma
	## general)

##----------------------------------------------------------------------------
	
	Fb = F0 - dF0*dx; ## Obtenci�n de los valores atr�s
	
	x = x0:dx:xN'; ## Definici�n del intervalo
	N = length(x); ## C�lculo de la cantidad de puntos
	
	D2 = cfd(2, 3, dx, 's')'; ## Columna de coeficientes derivada 2
	D1 = cfd(1, 3, dx, 's')'; ## Columna de coeficientes derivada 1

	F(:, 1) = F0; ## Valores iniciales
	
	for i = 1:N - 1
		AUX = [Fb, F(:,i)]; ## Valores atr�s y actuales respectivamente
		DEN = inv(D2(3)*eye(length(F0)) + D1(3)*F1(x(i))); ## Denominador
		F(:, i + 1) = DEN*(C(x(i)) - A(x(i))*F(:, i) - AUX*D2(1:2) - F1(x(i))*(AUX*D1(1:2)));
		## Despeje
		Fb = F(:, i); ## Actualizaci�n
	endfor
endfunction
function A = A(x) 
	## Matriz para la combinaci�n lineal de los valores de las
	## funciones del sistema (t�rminos de orden 0)
	A = [1/4, 1/4;
		9/32, 0];
endfunction
function C = C(x)
	## vector columna de t�rminos independientes
	C = [(5/10)*x; -3*(x^2)];
endfunction
function F1 = F1(x)
	## funci�n vectorial que acompa�a a los t�rminos de derivada primera
endfunction