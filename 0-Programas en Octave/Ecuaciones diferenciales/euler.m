function [T, F] = euler(t0, tf, dt, F0, dF)
## VALORES DE SALIDA-----------------------------------------------------

	## T: es el vector fila de tiempo
	
	## F es la matriz rectangular con tantas filas como componenentes de la
	## función vectorial y tantas columnas como puntos en el intervalo de
	## intergación. (Es la función vectorial dada en forma discreta)
	
## VALORES DE ENTRADA----------------------------------------------------

	## dF: es un puntero a la función que da la pendiente
	## t0: Es el instante inicial
	## tf: Es el instante final
	## dt: Es el paso
	## F0: es el valor incial de la función vectorial
	
#-------------------------------------------------------------------------

	T = t0:dt:tf; ## vector fila de tiempos
	N = length(T); 
	
	F(:, 1) = F0; ## condiciones iniciales
	for i = 1:N - 1
		k = dt*dF(T(i), F(i)); ## Incremento
		F(:,i + 1) = F(i) + k; ## Calculo del nuevo valor
	endfor
	
endfunction