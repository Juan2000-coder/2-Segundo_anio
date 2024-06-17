%Metodo de la potencia con varios criterios de detención
%ARREGLAR EL TEMA DE AUTOVALORES REPETIDOS Y DE ALGUNO QUE SEA CERO

##Creo que no hay problemaa si tenemos autovalores repetidos
##cuando un autovalor sea nulo creo que lo conveniente sería hacer:

##x=D(c,c)*x-A*x;
##de está manera nos evitamos el error de dividir por cero
##Por el momento no lo vamos a modificar, vemos que onda y después lo cambiamos

##NO FUNCIONA MUY BIEN CUANDO LOS AUTOVALORES SON DISTINTOS PERO ESTÁN MUY
## CERCA UNO DEL OTRO
function [D,P] = potencia(A,maxiter,tol)
	N=columns(A);
	x=rand(N,1);
	while norm(x,inf)==0
		x=rand(N,1);
	endwhile
	## cabe la posibilidad de que la matriz no sea diagonalizable, y en ese
	## caso no se usaria un for sino un while, en realidad es mas complejo que
	## eso, pero no nos vamos a ocupar de ese caso por el momento
	for i=1:N
		if i!=1
			x=xprev;
			for c=1:columns(P)
				x=D(c,c)*x-(A*x);
				
			endfor
		endif
		##eliminación de las componentes del vector previo en la dirección
		##de los autovectores ya encontrados para iterar nuevamente
		
		if norm(x,inf)<eps
			x=0;
			for c=1:N
				if abs(norm(eye(N)(:,c)-P*(inv(P'*P)*(P'(:,c))),inf))>eps
					aux=eye(N)(:,c);
					##determinación de los vectores de la base canonica que
					##no están contenidos en el espacio de vectores ya
					## calculados
					
					for k=1:columns(P)
						aux=D(k,k)*aux-(A*aux);
						##eliminación de las componentes contenidas en el
						## espacio de autovectores determinados hasta el
						## momento
					endfor
					x+=aux;
					## hacemos una combinación lineal con todos los
					## vectores que no están contenidos en el espacio de
					## los autovectores determinados hasta el momento
				endif
			endfor
		endif
		x/=norm(x,inf);
		xprev=x;k=0;flag=true;flag2=false;flag1=false;
		while flag
			k++;
			v=A*x;
			delta=(v'*x)/(x'*x);
			err=norm(v-delta*x,inf);
			if flag2
				c++;
				if c==0
					xk=v/norm(v,inf);
					##almacenamos el vector xk
					##no entra al inicio del subalgoritmo para el caso de
					## autovalores opuestos pero si en lo posterior
				endif
				if c==1
					xk_1=v;
					##almacenamos el vector intermedio xk+1
				endif
				if c==2;
					xk_2=v;
					#almacenamos el vector xk+2
					delta_aux=sqrt(norm(xk_1,inf)*(xk'*xk_2)/(xk'*xk));
					##calculamos el valor aproximado del autovalor
				endif
				if c==3
					v=(v+delta_aux*x)/2;
					## calculado el delta, eliminamos del vector de la nuev
					## iteración la componente del autovector del autovalor
					## consigno negativo
					c=-1;
					##ponemos el contador a menos 1 y en la siguiente
					## iteración guardamos el primer vector calculado
					##así vamos almacenando tres vectores consecutivos,
					## calculamos el delta y eliminamos del vector
					## siguiente su componente en la dirección del
					## autovector que se corresponde con el autovalor con
					## el signo negativo
				endif
			endif
			%deltas=v./x0;
			%err=abs(max(deltas)-min(deltas));
			if k==1
				errp=err;
			endif
			if errp<err
				##entra si el error en la iteración anterior es mejor que
				## el error en la iteració actual
				if i!=1
					for c=1:(i-1)
						v=D(c,c)*v-(A*v);
						##eliminación de las componentes en la dirección
						## de los autovectores
					endfor
				endif
			endif
			v/=norm(v,inf);
			if (flag1)&&(err>tol*10)&&(abs(errp-err)<tol)&&(k!=1)
				## subalgoritmo en caso de que se presenten autovalores
				## opuestos.
				## si se presenta este caso, entonces el error converge a
				## cierto valor distinto de cero
				c=0;
				flag1=false;#no vuelve a entrar a este estructura
				## condicional
				flag2=true;
				xk=v;
			endif
			if err<=tol
				printf("Aproximacion dentro de la tolerancia.\n");
				flag=false;
			endif
			if k>=maxiter
				flag=false;
			endif
			x=v;
			errp=err;
		endwhile
		printf("Iteraciones: %d.\n",k);
		D(i,i)=delta;
		P(:,i)=v;
	endfor
endfunction
##   cosas para la graficación y la devolución de información
##	printf("Numero de iteraciones: %d\n", k);
##	figure(1);title("delta");hold on; grid on;
##	plot(1:k,deltas(k),".r", "markersize",10);xlabel("iteraciones");ylabel("deltas");
##	figure(2);title("vectores");hold on;grid on;
##	colors=["r","b","g","k","y","c","m"];
##	xlabel("iteraciones");ylabel("componentes");
##	for i=1:rows(A);
##	plot(1:k, aprox(1,:),".","color",colors(mod(i,7)+1),"markersize",10);
##	endfor

