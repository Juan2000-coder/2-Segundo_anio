function  Borquez_Perez_Juan_Manuel_13567()
	printf("\nIndique la cantidad de puntos de la funcion discreta: ");
	N = input('');
	
	printf("\nIndique la abscisa del primer punto: ");
	x0 = input('');

	printf("\nIndique el paso: ");
	h = input('');
	
	xf = x0 + h*(N-1);
	
	Vfx = linspace(x0,xf,N)';

	Vder = Vfy = zeros(N,1);
	
	dc=(1/h)*[-0.5, 0, 0.5];
	df=(1/h)*[-1.5, 2, -0.5];
	db=(1/h)*[0.5, -2, 1.5];
	
	clc;
	printf("\nA continuacion indique las ordenadas de los puntos\n");
	
	for i=1:N
		printf("Vfy(%d) = ",i);
		Vfy(i) = input('');
	endfor
	clc;
	for i=1:N
		if i==1
			Vder(i) = df*Vfy(1:3);
		elseif i==N
			Vder(i) = db*Vfy(N-2:N);
		else
			Vder(i) = dc*Vfy(i-1:i+1);
		endif
	endfor
	M = [Vfx, Vfy, Vder];
	printf("\n     x    f(x)	   f'(x)\n");
	disp(M);
	
	figure(1);
	hold on; grid on;
	
	title("Grafica de la función y de la derivada");
	plot(Vfx, Vfy, "-r", Vfx, Vder, "-b"); xlabel("x"); ylabel("y");
	legend("f(x)","f'(x)");
	set(legend, "position", [0.2,0.8,0.01,0.01]);
endfunction