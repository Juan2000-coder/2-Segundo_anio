function [I, H, N] = richardson (i1, h1, n1, i2, h2, n2)
## VALORES DE SALIDA----------------------------------------------------------

	## I: Aproximaci�n mejorada de la intergral
	## H: Paso que corresponde a la aproximaci�n mejorada
	## N: Orden del error de la aproximaci�n mejorada

## VALORES DE ENTRADA---------------------------------------------------------
	
	## is: Aproximaci�n s
	## hs: Paso de la is
	## ns: Orden del error de la aroximaci�n is
	
##--------------------------------------------------------------------------	
	## Sigue siendo consistente cuando los extremos de integraci�n no tienen
	## una relaci�n creciente, osea se integra para atr�s en el eje x.
	
	n = min(n1,n2); ## La potencia corresponde al menor orden de error
	B = (h1/h2)^n; ## Es el Beta de la F�rmula
	I = (B*i2 - i1)/(B-1); ## Aproximaci�n mejorada
	
	## Es independiente de como hagamos el cociente de los pasos, siempre que
	## B pondere a la aproximaci�n que corresponde al paso en el denominador
	
	## El paso m�s grande en valor absoluto es el que determina el error de la
	## aproximaci�n mejorada. Aun cuando corresponda a un orden de error
	## mayor (osea mas preciso si el paso es menor a 1).
	
	## Teniendo en cuenta que i1 e i2 son aproximaciones de lo mismo, ambos
	## pasos tendr�n el mismo signo
	
	## Obtenci�n del paso de la aproximaci�n mejorada
	
	if h1 > 0
		H = max(h1,h2);
	else
		H = -max(-h1,-h2);
	endif
	
	## Orden del error de la nueva aproximaci�n dado por el m�todo
	N = n + 2;
endfunction
