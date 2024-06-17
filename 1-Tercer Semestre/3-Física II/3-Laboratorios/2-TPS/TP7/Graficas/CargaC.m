1;
%esto es la declaración de unos punteros a funciones
f1=@teoricaC;
f2=@ajusteC;

hf=figure(1); %la variable hf me permite guardar la figura despues

hold on;grid on;


%vector par graficar los puntos
tm=[0;19.57;42.58;77.43;108.46];%son los timpo que midieron
vm=reshape(0:5:20,5,1);

%configuración de ejes
set(gca,"xtick",[0:10:110]);
set(gca,"ytick",[0:5:25]);
a=get(gcf,"currentaxes");
set(a,"fontsize",8,"linewidth",1.5);
xlabel("Tiempo(s)","fontsize",10,"fontname","Times New Roman","fontweight","bold");
ylabel("Voltaje(V)","fontsize",10,"fontname","Times New Roman","fontweight","bold");

%Titulo
%t=title("Grafica Teórica V_c = f(t)");
%t=title("Gráfica por Interpolación V_c = f(t)");
t=title("Comparación Gráfica Teórica y Gráfica Ajustada");
set(t,"fontname","Times New Roman","fontsize",11,"fontweight","Normal");

%ploteo de la función
%fplot(f1,[0,110],"linewidth",1.5);

%ploteo de la comparación
fplot(f1,[0,110],"linewidth",1.5);
fplot(f2,[0,110],"linewidth",1.5);

%leyenda
legend("Función Teórica", "Función Ajustada");
set(legend,"position",[0.2,0.65,0.01,0.01],"fontname","Times New Roman","fontsize",9.5,"box","on");

%obtención de los datos;
Datos(:,1)=vm;
Datos(:,2)=f1(tm);
Datos(:,3)=f2(tm);

%ploteo puntos función teórica
plot(tm,Datos(:,2),"markersize",10,"marker",".","linestyle","none","color","k","displayname","Valores Teóricos");

%ploteo de los puntos muestra
plot(tm,vm,"markersize",10,"marker",".","linestyle","none","color","r","displayname","Valores Medidos");

%ploteo puntos Funcion ajustada
plot(tm,Datos(:,3),"markersize",10,"marker",".","linestyle","none","color","b","displayname","Valores Ajustados");


%guardado de la figura

%saveas(hf, "TeoricaCapacitor.png","png");
%saveas(hf, "TeoricaCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.png","png");
saveas(hf, "CargaC.png","png");
saveas(hf, "CargaC.jpg","jpg");

%Exportación de los datos
f=fopen("CargaC.txt","w");
fprintf(f,"Puntos Muestra    Valores Tóricos         Valores Ajustados\n");
fprintf(f,"%d %d %d %d %d\n",Datos);
fclose(f);