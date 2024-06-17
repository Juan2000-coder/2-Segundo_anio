function retval = trf (fm,n)
	##fm = frecuencia de muestreo
	tm = 1/fm; ##periodo de muestro
	##n = numero de muestras
	#tiempo transcurrido es (n-1)*tm. Dado de n-1 es el número de intervalos
	T = 0:tm:(n-1)*tm; #vector de tiempos
	Y = sin(2*pi*1000*T); ##señal
	wn = 0:fm/n:(fm-(fm/n)); ##vector de frecuencias
	figure(1); hold on; grid on;
	plot(T,Y,'-r');
	figure(2); hold on; grid on;
	plot(wn,abs(fft(Y)),'r');
endfunction
