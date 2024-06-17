function [F] = fourier (f, p, m, maxter, tol)
	figure(1);
	x = linspace(-p, p, m)'; ##discretización del intervalo
	y = f(x); ##discretización de la funcion
	puntos = [x, y];
	flag = true;
	n = -1;
	F = zeros(m,1);
	while flag
		n++;
		if n==0
			F(:,1) = (0.5/p)*romberg(puntos,'t', eps);
		else
			for i=1:2
				if i==1
					dtrig = sin(n*pi*x/p); ##discretización del seno
				elseif i==2
					dtrig = cos(n*pi*x/p); ##discretización del coseno
				endif
				fdisc = y.*dtrig; ## funcion discreta a integrar
				puntos = [x, fdisc];
				c = (1/p)*romberg(puntos,'t', eps);
				F = F + c*dtrig; ##suma del término correspondiente
			endfor
			X = [x(1:m-1)-2*p; x; x(2:end) + 2*p];
			Y = [F(1:m-1);F; F(2:end)];
			colores=['r','b','g','c'];
			plot (X,Y,"color",colores(mod(n, 4)+1));
			pause(0.1);
		endif
		err = norm(F(2:m-1)-y(2:m-1), inf);
		if err <= tol
			flag = false;
		endif
		if n + 1 >= maxter
			flag = false;
		endif
	endwhile
	printf("Numero de suma parcial: %d\n", n);
endfunction
