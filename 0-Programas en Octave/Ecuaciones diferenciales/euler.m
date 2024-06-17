function [T, F] = euler(t0, tf, dt, F0, dF)
## VALORES DE SALIDA-----------------------------------------------------

	## T: es el vector fila de tiempo
	
	## F es la matriz rectangular con tantas filas como componenentes de la
	## funci�n vectorial y tantas columnas como puntos en el intervalo de
	## intergaci�n. (Es la funci�n vectorial dada en forma discreta)
	
## VALORES DE ENTRADA----------------------------------------------------

	## dF: es un puntero a la funci�n que da la pendiente
	## t0: Es el instante inicial
	## tf: Es el instante final
	## dt: Es el paso
	## F0: es el valor incial de la funci�n vectorial
	
#-------------------------------------------------------------------------

	T = t0:dt:tf; ## vector fila de tiempos
	N = length(T); 
	
	F(:, 1) = F0; ## condiciones iniciales
	for i = 1:N - 1
		k = dt*dF(T(i), F(i)); ## Incremento
		F(:,i + 1) = F(i) + k; ## Calculo del nuevo valor
	endfor
	
endfunction