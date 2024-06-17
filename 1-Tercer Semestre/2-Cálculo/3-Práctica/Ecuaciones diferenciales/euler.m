function [T,F] = euler(dF, t0, F0, tf, dt)
	## F es la función devuelta en forma discreta en el intervalo discreto, en
	## general es una matriz con tantas filas como funciones en el sistema y
	## contantas columnas como puntos en el intervalo discretizado
	## dF es un puntero a la función que da la pendiente
	
	T = t0:dt:tf; ##vector fila de tiempos
	N = length(T); 
	
	F(:,1) = F0; ##condiciones iniciales
	for i = 1:N-1
		k = dt*dF(T(i), F(i)); ##incremento
		F(:,i+1) = F(i) + k; ##calculo del nuevo valor
	endfor
	
endfunction