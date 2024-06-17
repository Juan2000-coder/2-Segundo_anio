function pruebita()
##	t0 = 0;
##	tf = 6;
##	dt = 2e-3;
##	T = t0:dt:tf;
##	u0 = [0; 0];
##	w = 1/2;
##	U = RK(T,u0,dt,w);
##	
##	#grafica
##	figure(1);title("GRAFICA DE u1 EN FUNCIÓN DE t EN EL INTERVALO");hold on; grid on;
##	plot(T,U(1,:),'-r');xlabel("tiempo");ylabel("u1(t)");
##	
##	p=0;
##	do 
##		p++;
##		puntobase = U(1,p);
##	until puntobase!=0;
##
##	contador =  1; #la función es nula en t=0
##	for i=p:length(T)
##		if ((aux=U(1,i))*puntobase) < 0
##			puntobase = aux;
##			contador++;
##		endif
##	endfor
##	printf("\nNumero de veces que la funcion se anula: %d\n", contador);
##	
##	figure(2);title("GRÁFICA DE du1/dt EN FUNCIÓN DE u1 EN EL INTERVALO");
##	hold on; grid on;
##	plot(U(2,:),U(1,:),'-b');xlabel("u1");ylabel("du1/dt");
##	
##	y = integrando(T,U);
##	Int = trapecios(y,dt);
##	
##	printf("\nValor entontrado de la integral: %d\n",Int);
##	
##	du = derivadas(U);
##	
##endfunction
##function Z = RK(T,Z0,dt,w)
##	Z(:,1) = Z0;
##	n = length(T);
##	for i=1:n-1
##		t = T(i);	
##		Z(:,i+1) = Z(:,i) + dt*fi(dt,Z(:,i),t,w);
##	endfor
##endfunction
##function fi = fi(dt, Z, t, w)
##	k1 = dZ(t,Z);
##	tg = t + dt/(2*w);
##	Zg = Z + dt*k1/(2*w);
##	k2 = dZ(tg,Zg);
##	fi = (1-w)*k1 + w*k2;
##endfunction
##function dZ = dZ(t,Z)
##	m = 0.1;
##	T = 15e3/13;
##	L = 100;
##	N = 3;
##	P = 10;
##	OM = 1;
##	dx = L/(N-1);
##	om2 = 2*T/(m*(dx^2));
##	f = P/m;
##	b = [0;f*sin(OM*t)];
##	K = [0, 1; -om2, 0];
##	dZ = b + K*Z;
##endfunction
##function I = trapecios(y,h)
##	I = 0;
##	n = length(y);
##	for i=1:n
##		if (!mod(i,2))&&(i!=n)
##			I+=y(i);
##		else
##			I+=(2*y(i));
##		endif
##	endfor
##	I*=(h/2);
##endfunction
##function y = integrando(Tiempo,U)
##	m = 0.1;
##	T = 15e3/13;
##	L = 100;
##	N = 3;
##	P = 10;
##	OM = 1;
##	dx = L/(N-1);
##	om2 = 2*T/(m*(dx^2));
##	f = P/m;
##	y = f*sin(OM*Tiempo)-om2*U(1,:);
##endfunction
##function du = derivadas(U)
##	L = 100;
##	N = 3;
##	dx = L/(N-1);
##	d1f = (1/dx)*[-1.5,2,-0.5];
##	d1b = (1/dx)*[0.5,-2,1.5];
##	d1c = (1/dx)*[-0.5,0,0.5];
##	u0_tf = (4/3)*U(1,end);
##	du0_tfdt = d1f*[u0_tf;U(1,end);0];
##	du2_tfdt = d1b*[u0_tf;U(1,end);0];
##	du1_tfdt = d1c*[u0_tf;U(1,end);0];
##	du = [du0_tfdt;du1_tfdt;du2_tfdt];
##endfunctio

##T = linspace(-8,8,100)';
##Y = zeros(100,1);
##for n = 1:10
##	Y += ((6/(n*pi))*sin(n*pi*T/4));
##endfor
##	Y=Y*(-1);
##	Y+= 3;
##	figure(1);grid on;
##	plot(T,Y,"-r");xlabel("x");ylabel("t");
##	xticks(-8:8)
##endfunction
##	tau = 4;
##	w0 = 2*(2*pi*50); #es el doble de la frecuencia angular correspondiente a
##	## 50hZ
##	P = (2*pi)/w0; #Periodo de la onda recortada
##	N = 10000;
##	T = linspace(0,2000*P,10000);
##	Vout = (2/pi)*(1-exp(-T/tau));
##	#Vin = 2/pi;
##	for n = 1:N
##		zn = complex(1, tau*n*w0);
##		rho = abs(zn);
##		phi = angle(zn);
##		an = 4/(pi*(1-4*(n^2)));
##		#Vin += an*cos(n*w0*T);
##		Vout -= (an/rho)*(cos(phi)*exp(-T/tau)-cos(n*w0*T-phi));
##	endfor
##	figure(1); hold on; grid on;
##	plot(T, Vout, '-r');xlabel("tiempo");ylabel("onda");
##	#plot(T, Vin, '-b');
	eps = 0.4;
	wn = 2*pi*5;
	w0 = 2*(2*pi*50);
	P = 2*pi/w0;
	N = 1000;
	T = linspace(0, 50*P, 2000);
	r = -wn*eps; w = wn*sqrt(1-eps^2);
	z0 = complex(r, w);
	Vo = (2/pi)*(1 + (wn/w)*exp(r*T).*sin(w*T-angle(z0)));
	Vin = 2/pi;
	for n = 1:N
		an = 4/(pi*(1-4*n^2));
		zn1 = (z0^2 + (n*w0)^2)/z0;
		zn2 = (z0 - n*w0*j)*(conj(z0) - n*w0*j); 
		Vo += (an*wn^2*((exp(r*T).*sin(w*T-angle(zn1)))/(w*abs(zn1)) + cos(n*w0*T-angle(zn2))/abs(zn2)));
		Vin += an*cos(n*w0*T);
	endfor
	figure(1); hold on; grid on;
	plot(T, Vo,'-k');xlabel("tiempo");ylabel("onda");
	#plot(T, Vin, '-b');
endfunction