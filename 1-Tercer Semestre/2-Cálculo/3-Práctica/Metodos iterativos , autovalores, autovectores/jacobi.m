%Jacobbi no matricial
function x = jacobi(A,b,x0,maxiter,tol)
	flag=true;k=0;x0=reshape(x0,length(x0),1);b=reshape(b,length(b),1);
	while flag
		k++;
		for i=1:rows(A)
			sum = b(i);
			for j=1:columns(A)
				if i!=j
					sum-=(A(i,j)*xprev(j));
				endif
			end
			x(i,1)=sum/A(i,i);
		endfor
		err=max(abs(A*x-b));
		if err<=tol
			printf("Aproximacion dentro de la tolerancia.\n");
			flag=false;
		endif
		if k>=maxiter
			flag=false;
		endif
		x0=x;
		grafica(:,k)=A*x;
	endwhile
	printf("Iteraciones: %d\n", k);
	figure(1);
	hold on; grid on;
	colors=["r","g","k","b","y","m","w"];
	for i=1:rows(A)
		plot([0,k], [b(i),b(i)], "linestyle",'--',"color",colors(mod(i,7)+1));
		plot(1:k, grafica(i,:), colors(mod(i,7)+1));
	endfor
endfunction