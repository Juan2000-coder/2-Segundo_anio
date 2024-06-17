function [T, F] = rk (t0, tf, dt, Y1, dF, w)
	
## VALORES DE SALIDA---------------------------------------------------------
	## T: es el vector fila de tiempo
	
	## F es la matriz rectangular con tantas filas como componenentes de la
	## funci�n vectorial y tantas columnas como puntos en el intervalo de
	## intergaci�n. (Es la funci�n vectorial dada en forma discreta)	
	
## VALORES DE ENTRADA--------------------------------------------------------

	## dF: es un puntero a la funci�n que da la pendiente
	## t0: Es el instante inicial
	## tf: Es el instante final
	## dt: Es el paso
	## Y1: es el valor incial de la funci�n vectorial
	## w: es el valor utilizado para el m�todo de Runge-Kutta
	
##--------------------------------------------------------------------------
	## T es el vector de tiempos
	## F es la funci�n vectorial en forma discreta para cada t
	
	T = t0:dt:tf;
	N = length(T);	##cantidad de puntos
	
	##valor inicial de la funci�n vectorial cuyas componentes son
	## las funciones soluci�n de la ecuaci�n diferencial
	F(:, 1) = Y1;
	
	for i = 1:N - 1
		## El metodo de Runge Kutta generalizado es Fn+1=Fn +
		## dt*fi(Fn, tn, dt, dF)
		
		F(:, i + 1) = F(:, i) + dt*fi(T(i), F(:,i), dF, dt, w);
		
	endfor
endfunction

function K = fi(t, F, dF, dt, w)
## Esta es la funci�n que da la pendiente del incremento en el m�todo de Runge
## Kutta
	## RK generalizado es:
	## fi= (1-w)*f(tn, Fn) + w*f(tg, Fg)
	## tg = tn + dt/(2*w);
	## Fg = Fn + dt*f(tn, yn)/(2*w)
	
	K1 = dF(t, F);
	
	tG = t + dt/(2*w);
	FG = F + dt*K1/(2*w);
	
	K2 = dF(tG, FG);
	K = (1 - w)*K1 + w*K2;
endfunction