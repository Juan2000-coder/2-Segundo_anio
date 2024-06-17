function y = verificacion_fourier
	p = 2;
	y = pi;
	x = linspace(-p,p,100);
	for n=1:10000
		y = y - ((2*((-1).^n))*sin(n*x))/n;
	endfor
	plot(x,y,"-r"); hold on; grid on;
endfunction
