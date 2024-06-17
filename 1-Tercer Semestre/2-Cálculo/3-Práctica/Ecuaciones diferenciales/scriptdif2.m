1;
h=2;
x1=0;	%Valor de contorno izquierdo
xN=12;	%valor de contorno derecho

y1=0;	%valor de la función en el valor de contorno izquierdo
yN=0;	%valor de la función en el valor de contorno derecho

%Todas las funciones a continuación reciben vectores y devulven la función
## discrete en el intervalo entre los valores de contorno
function y=f2(x)%función de x que acompaña a la derivada de segundo orden
	y=-500*(1./[10;20;40;80;40;20;10]);
	%no ponemos 10 porque si no estariamos calculando los
	## autovalores y aurovectores de -A 
endfunction
function y=f1(x)%función de x que acomparña a la derivada de primer orden
	y=0*x;
endfunction
function y=f0(x)%función de x que acompaña a la derivada de orden 0
	y=0*x;%si es problema de sutovalores tenemos que definir a esta
	## funcion como la función constante cero, armamos la matriz del
	## sistema y la de términos independientes y luego encontramos los
	## autovalores y autovectores
endfunction
function y=f(x)%función de x
	y=0*x;
endfunction
C=0;%termino independiente;
F2=@f2;F1=@f1;F0=@f0;F=@f;%handles de las funciones definidas
[A,B] = dif2 (x1,xN,h,F2,F1,F0,F,C);

##devulta la matriz ampliada del sistema todavía es neceario definir las filas
## superior e inferior correspondientes a las condiciones de contorno

A=A(2:rows(A)-1,:);
	## eliminamos las filas nulas de la matriz A como se
	## devulve en dif2
C1=A(:,1); CN=A(:,columns(A));
	##Nos quedamos con las columnas laterales de la matriz A que son
	## modificadas por los valores de la función en el contorno
A=A(:,2:columns(A)-1);
	##eliminamos de A las columnas C1 Y CN
B=B(2:length(B)-1);
	##eliminamos la primera y última fila de B
flag=(B-y1*C1-yN*CN)==0;
	##verificamos que sea un problema de autovalores
if flag
	[V,D]= eig(A);%resolvemos el problema de autovalores
else
	printf("\nNo es problema de autovalores.\n");
endif
plot(X,Y1,"-r",X,Y2,"-r",X,Y3,"-r",x,u1,".k","markersize",10,x,2*u1,".k","markersize",10,x,3*u1,".k","markersize",10);