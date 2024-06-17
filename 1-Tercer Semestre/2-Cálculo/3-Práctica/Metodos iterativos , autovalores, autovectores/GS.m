%GAUSS SSEIDEL NO MATRICIAL


function x = GS(A,b,x0,maxiter,tol)
	x=reshape(x0,length(x0),1);
	flag=true;k=0;
	while flag
		k++;
		for i=1:rows(A)
			sum=b(i);
			for j=1:columns(A)
				if i!=j
					sum-=(A(i,j)*x(j));
				endif
			endfor
			x(i)=sum/A(i,i);
		endfor
		%err=max(abs(x-x0));
		err=max(abs((A*x)-b));
		if err<=tol
			flag=false;
			printf("Aproximacion dentro de la tolerancia.\n");
		endif
		if k>=maxiter
			flag=false;
		endif
		imagenes(:,k)=A*x;
		aproximaciones(:,k)=x;
	endwhile
	printf("Iteraciones:%d\n", k);
	figure(1)
	title("Aproximaciones");
	hold on;grid on;
	colors=["r","g","k","b","y","m","w"];
	for i=1:rows(A)
		plot(1:k, aproximaciones(i,:), colors(mod(i,7)+1));xlabel("iteraciones");ylabel("componentes");
	endfor
	figure(2);
	title("Imagenes aproximaciones");
	hold on;grid on;
	colors=["r","g","k","b","y","m","w"];
	for i=1:rows(A)
		plot([0,k], [b(i),b(i)], "linestyle",'--',"color",colors(mod(i,7)+1));
		plot(1:k, imagenes(i,:), colors(mod(i,7)+1));xlabel("Iteraciones");ylabel("componentes imagen");
	endfor
endfunction
