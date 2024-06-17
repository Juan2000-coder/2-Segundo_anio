%jacobi matricial

function x = jacobim(A,b,x0,maxiter,tol)
	b=reshape(b,length(b),1);x0=reshape(x0,length(x0),1);
	T=-A;C=b;
	for i=1:rows(A)
		T(i,:)=T(i,:)/A(i,i);
		T(i,i)=0;
		C(i)=C(i)/A(i,i);
	endfor
	flag=true;k=0;
	while flag
		k++;
		x=T*x0+C;
		%err=max(abs(x-x0));
		err=max(abs(A*x-b));
		if err<=tol
			printf("Aproximacion dentro de la tolerancia.\n");
			flag=false;
		endif
		if k>=maxiter
			flag=false;
		endif
		x0=x;
	endwhile
	printf("Numero de iteraciones: %d\n", k);
endfunction
