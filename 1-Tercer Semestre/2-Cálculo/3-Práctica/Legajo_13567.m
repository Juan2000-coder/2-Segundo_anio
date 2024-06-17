function Legajo_13567()
	
##DATOS DE IDENTIFICACI�N---------------------------------------------------
	printf("\n\tAlumno: BORQUEZ PEREZ Juan Manuel");
	printf("\n\tLegajo: 13567");
	printf("\n\tEspecialidad: Industrial");
	printf("\n\tTema 1\n");

##RESOLUCI�N------------------------------------------------------------------

	N = 10;
	T = linspace(0.25, 2.5,N)'; #vector columna con los valores de t(k)
	h = H(T); #funci�n que calcula h(k) con los valores de t(k) en T;
	
##CONSTRUCCI�N DE LA MATRIZ A--------------------------------------------------
	
	## Aprovechamos el hecho de que toda la primer columna de A est� compuesta
	## de unos y la inicializamos como una matriz de unos.
	
	A = ones(N,N);
	
	## Con el siguiente for construimos la matriz por columnas
	
	## Al observar que se trata de la matriz de coeficientes que se obtiene
	## cuando se interpola con polinomios de Newton y que es conocida, hacemos
	## el uso de los operadores para producto elemento por elemento para
	## vectores definidas en octave.
	
	for k = 2:N
		A(:,k) =  A(:,k-1).*(T-T(k-1));
	endfor
	
	printf("\nMATRIZ A: \n");
	disp(A);

##CALCULO DE LOS VALORES DE LAS INC�GNITAS-------------------------------------
	f = zeros(N,1); ## contendra los valores de las incognitas
	for i=1:N
		## inicializamos cada una de las componentes de f con el valor
		## correspondiente del vector h (es decir, h(i));
		f(i) = h(i);
		
		## Con este for vamos sumando los t�rminos que aparecen en la
		## sumatoria
		
		#los l�mites inferior y superior del for son correspondientes con los
		## l�mites inferior y superior de la sumatoria respectivamente
		
		for k = 1:(i-1)
			## en cada iteracion incorporamos un nuevo t�rmino de la sumatoria
			
			f(i)-=(A(i,k)*f(k));
			
			## f(i) funciona como un acumulador
		endfor
		
		## Una vez determinado el numerador dividimos por el t�rmino en el
		## denominador
		f(i)/=A(i,i);
	endfor

##GR�FICOS--------------------------------------------------------------------
	figure(1);title("GR�FICAS");hold on; grid on;
	
	plot(T, h,'--r',"marker",'.',"markersize",9, T, f,'--b',"marker",'.',"markersize",9);
	
	## definimos las leyendas de los ejes y los l�mites del gr�fico
	xlabel("t(k)", "fontsize",13);ylabel("h/f","fontsize",13);
	xlim([T(1),T(end)]);
	
	xticks(T); #ponemos las marcas de t(k);
	legend("h(k)","f(k)"); #legendas
	
	#cambiamos el tama�o de la fuente de las leyendas
	set(legend,"fontsize", 13);
	
endfunction
function h = H(T)
	p = 3;
	w = 3;
	
	## aprovechamos el hecho de que las funciones involucradas est�n definidas
	## para vectores y as� obtener directamente el valor de h con el vector T
	
	h = (100/w)*exp(-p*T).*sin(w*T);
endfunction