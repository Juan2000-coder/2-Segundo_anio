1;
%el 1 al principio es para que lo identifique como un script

%esto es la declaraci�n de unos punteros a funciones
f1=@f;
f2=@lagrange;

hf=figure(1); %la variable hf me permite guardar la figura despues

hold on;grid on;


%vector par graficar los puntos
tm=[0;19.57;42.58;77.43;108.46];%son los timpo que midieron

%configuraci�n de ejes
set(gca,"xtick",[0,30,60,90,19.57,42.58,77.43,108.46]);
set(gca,"ytick",[0:5:25,reshape(f1(tm),1,5)]);
a=get(gcf,"currentaxes");
set(a,"fontsize",10,"linewidth",1.5);
xlabel("t (s)","fontsize",12,"fontname","Times New Roman");
ylabel("V_c (V)","fontsize",12,"fontname","Times New Roman");

%Titulo
%t=title("Grafica Te�rica V_c = f(t)");
%t=title("Gr�fica por Interpolaci�n V_c = f(t)");
t=title("Comparaci�n de Gr�ficas");
set(t,"fontname","Times New Roman","fontsize",13,"fontweight","Normal");

%ploteo de la funci�n
%fplot(f1,[0,110],"linewidth",1.5);

%ploteo de la comparaci�n
fplot("[f(x),lagrange(x)]",[0,110],"linewidth",1.5);

%leyenda
str={"Te�rica";"Interpolaci�n"};
set(legend,"string",str);
set(legend,"position",[0.28,0.6,0.05,0.05],"fontname","Times New Roman","fontsize",8,"box","on");

%ploteo puntos primera funcion
plot(tm,f1(tm),"markersize",10,"marker",".","linestyle","none","color","k","displayname","Valores Te�ricos");

%ploteo puntos segunda funcion
plot(tm,f2(tm),"markersize",10,"marker",".","linestyle","none","color","r","displayname","Puntos muestra");


%guardado de la figura

%saveas(hf, "TeoricaCapacitor.png","png");
%saveas(hf, "TeoricaCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.png","png");
saveas(hf, "ComparacionCapacitor.png","png");
saveas(hf, "ComparacionCapacitor.jpg","jpg");
