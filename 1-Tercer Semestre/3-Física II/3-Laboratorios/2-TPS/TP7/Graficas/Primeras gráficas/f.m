%Funcion sobre la cual trabajamos%

function y = f(x)
%=======0estas son otras funciones que nada que ver
	%y = ((x.^3)-(x.^5)+1)./(x.^2+1);
	%y=x.^2-3;
	%y=x-2^(-x);
	%y=-7.5*(e.^(-2*x))+1.5*(e.^(-3*x))+3;
	%dy=15*(e.^(-2*x))-4.5*(e.^(-3*x));
	%y=5*(x.^3)+10*(x.^2)-100;
%===========================================
	%funciones teóricas de la tensión en el capacitor para la carga	
	y=30*(e.^(-x/(0.94*(10^2))));%Resistor carga
	%y=30*(1-(e.^(-x/(0.94*(10^2)))));%capacitor
	%para la descarga van otras funciones
endfunction