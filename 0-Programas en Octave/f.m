
function [Y] = f (t,U)
	## Hacemos el caso general de un sistema de ecuaciones diferenciales,
	## entonces y es el vector de los valores de las funciones en el instante
	## t. En general podemos escribir dF/dt=C+A*Y. En donde A es la matriz de
	## coeficiente que opera sobre el vector de los valores de las funciones y
	## C es un vector que se corresponde con los términos independientes en el
	## sistema de ecuaciones diferenciales
	
	## Consideremos el caso de la superposición de dos MAS en diferenctes ejes
	## Bueno necesitamos como parametros las constantes de cada uno de los mas
	## y la masa única del objeto. Suponemos el caso no amortiguado por el
	## momento. Ademas necesitamos conocer el ángulo entre las direcciones y
	## la posicion inicial y la velocidad inicial
	
	## tenemos: d2x/dt2+(k1/m)*x=0;
	## d2
	## y=50*(t-(20/3)) + (177/3)*exp(-0.3*t).*t + (109/0.3)*exp(-0.3*t);
	#y = ((-1/4)*(x.^3))+((9/4)*(x.^2))-(6*x)+(9/2);
	#dy = -(3/4)*(x.^2)+(9/2)*x-6;
	A = [-4,1,0,1,0,0,0,0,0;
		1,-4,1,0,1,0,0,0,0;
		0,1,-4,0,0,1,0,0,0;
		1,0,0,-4,1,0,1,0,0;
		0,1,0,1,-4,1,0,1,0;
		0,0,1,0,1,-4,0,0,1;
		0,0,0,1,0,0,-4,1,0;
		0,0,0,0,1,0,1,-4,1;
		0,0,0,0,0,1,0,1,-4];
	B=[75;75;175;0;0;100;50;50;150];
	Y = (8.35e-3)*(A*U + B);
endfunction