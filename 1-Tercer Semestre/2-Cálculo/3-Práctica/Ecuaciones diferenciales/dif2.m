function [A,B] = dif2 (x1,xN,h,f2,f1,f0,f,C)
	
	## f2,f1,f0,f,C son las funciones coeficientes de la ecuación diferencial,
	## el incice indica el orden de la derivada que acompaña la función
	## esas funciones están vecotrizadas
	
	N=1+(xN-x1)/h;%cantidad de puntos
	
	%f es una función de x dada en forma discreta
	%si se indica un solo número, se interpreta como un coeficiente de las x
	
	x=x1:h:xN;
	x=x'; %discretización del intervalo
	
	[L2,n2]=cfd(2,3,h,'s');
	[L1,n1]=cfd(1,3,h,'s');
	
	#Calculo de la fila de coeficientes para las derivadas primera y segunda
	## con 3 puntos un paso h ambas simétrica 's'
	
	A=A2=A1=A0=D2=D1=zeros(N);
	
	a2=f2(x); 
	a1=f1(x);
	a0=f0(x);
	b=f(x);
	
	## calculo de los vectores de coeficientes y término independiente en la
	## ecuación diferencial.

	for i=2:N-1
		A2(i,i)=a2(i);
		A1(i,i)=a1(i);
		A0(i,i)=a0(i);
		D2(i,i-1:i+1)=L2;
		D1(i,i-1:i+1)=L1;
	endfor
	A+=(A2*D2+A1*D1+A0);
	## Armado de la matriz del sistema
	## Observar que quedan dos filas nulas, las correspondientes a las
	## condiciones de frontera  arriba y abajo de la matriz
	
	B=C-b; #Vector de términos independientes
	B(1)=0; 
	B(end)=0; 
	# #se anulan el primer y último elementoo correspondientes a las
	## condiciones de frontera
endfunction
