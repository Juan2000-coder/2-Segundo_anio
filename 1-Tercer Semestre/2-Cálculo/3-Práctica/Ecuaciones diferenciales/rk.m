function [T, F] = rk (Y1, t0, tf, dt, dF, w)
	## T es el vector de tiempos
	## F es la función vectorial en forma discreta para cada t
	
	T = t0:dt:tf;
	N = length(T);	##cantidad de puntos
	
	##valor inicial de la función vectorial cuyas componentes son
	## las funciones solución de la ecuación diferencial
	F(:,1) = Y1;
	
	for i=1:N-1
		## El metodo de Runge Kutta generalizado es Fn+1=Fn +
		## dt*fi(Fn,tn,dt,dF)
		
		F(:,i+1) = F(:,i) + dt*fi(T(i), F(:,i), dF, dt, w);
	endfor
endfunction
function K = fi(t, F, dF, dt, w)
	##RK generalizado es:
	##fi= (1-w)*f(tn, Fn)+w*f(tg, Fg)
	## tg= tn + dt/(2*w);
	## Fg= Fn + dt*f(tn, yn)/(2*w)
	K1 = dF(t,F);
	
	tG = t + dt/(2*w);
	FG = F + dt*K1/(2*w);
	
	K2 = dF(tG, FG);
	K = (1-w)*K1 + w*K2;
endfunction