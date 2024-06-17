%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   f(x)=mx  entre  0 y A; f(x)=1 entre A y 2A; serie Fourier completa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
clc, clear
A=1;L=2*A;m=1;
%para la función verdadera
x=0:L/100:L;
nx=length(x);
for i=1:(nx+1)/2
    y(i)=m*x(i);
end
for i=(nx+1)/2:nx
    y(i)=1;
end

%para la serie Fc
x0=-3*L:.01:3*L;
N=length(x0);
for i=1:N %PARA SERIE DE COSENOS DE FOURIER
    y0c(i)=3/4;
end
sc=zeros(1,N);
ss=zeros(1,N);

for n=1:200       %SERIE COSENOS
    % en s acumulo a_n*cos(n*pi*x/p)+b_n*sin(n*pi*x/p), p=L/2
    % en ss acumulo b_n*sin(n*pi*x/p) p=L
    % en sc acumulo a_n*cos(n*pi*x/p), p=L
    %s=s+(V-L)/(n*pi)*sin(2*n*pi*A/L)*cos(2*n*pi*x0/L)+(L-V)/(n*pi)*(cos(2*n*pi*A/L)-1)*sin(2*n*pi*x0/L);
    ss=ss+(sin(n*pi/2)*(1+4/(n^2*pi^2))+2/(n*pi)*(cos(n*pi/2)-(-1)^n))*sin(n*pi*x0/2);
    sc=sc+4/(n^2*pi^2)*(cos(n*pi/2)-1)*cos(n*pi*x0/2);
   
    Fc=y0c+sc;
    plot(x,y,'r') %grafica funcion original, en rojo
    hold on
    plot(x0,Fc)  %grafica serie Fourier completa en azul
    plot(x,y,'r')
    xlim([-3*L,3*L])
    ylim([-1,L+1])
    hold off
    title(num2str(n))
    grid on
    drawnow
end
for n=1:200      %SERIE SENOS
    % en ss acumulo b_n*sin(n*pi*x/p) p=L
    ss=ss+(sin(n*pi/2)*(4/(n^2*pi^2))-2/(n*pi)*cos(n*pi/2)+2/(n*pi)*(cos(n*pi/2)-(-1)^n))*sin(n*pi*x0/2);
    Fs=ss;
    plot(x,y,'r') %grafica funcion original, en rojo
    hold on
    plot(x0,Fs)  %grafica serie Fourier completa en azul
    plot(x,y,'r')
    xlim([-3*L,3*L])
    ylim([-1,L+1])
    hold off
    title(num2str(n))
    grid on
    drawnow
end