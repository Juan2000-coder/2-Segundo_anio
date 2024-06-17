function [I, H, N] = richardson (i1, h1, n1, i2, h2, n2)
## VALORES DE SALIDA----------------------------------------------------------

	## I: Aproximación mejorada de la intergral
	## H: Paso que corresponde a la aproximación mejorada
	## N: Orden del error de la aproximación mejorada

## VALORES DE ENTRADA---------------------------------------------------------
	
	## is: Aproximación s
	## hs: Paso de la is
	## ns: Orden del error de la aroximación is
	
##--------------------------------------------------------------------------	
	## Sigue siendo consistente cuando los extremos de integración no tienen
	## una relación creciente, osea se integra para atrás en el eje x.
	
	n = min(n1,n2); ## La potencia corresponde al menor orden de error
	B = (h1/h2)^n; ## Es el Beta de la Fórmula
	I = (B*i2 - i1)/(B-1); ## Aproximación mejorada
	
	## Es independiente de como hagamos el cociente de los pasos, siempre que
	## B pondere a la aproximación que corresponde al paso en el denominador
	
	## El paso más grande en valor absoluto es el que determina el error de la
	## aproximación mejorada. Aun cuando corresponda a un orden de error
	## mayor (osea mas preciso si el paso es menor a 1).
	
	## Teniendo en cuenta que i1 e i2 son aproximaciones de lo mismo, ambos
	## pasos tendrán el mismo signo
	
	## Obtención del paso de la aproximación mejorada
	
	if h1 > 0
		H = max(h1,h2);
	else
		H = -max(-h1,-h2);
	endif
	
	## Orden del error de la nueva aproximación dado por el método
	N = n + 2;
endfunction
