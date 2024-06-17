1;
%esto es la declaración de unos punteros a funciones
f1=@ajusteC;
f2=@AjusteR;
f3=@sumaddp;

raizsumaddp=secante(70,95,f3,1e-12,200);

hf=figure(1); %la variable hf me permite guardar la figura despues

hold on;grid on;


%vector par graficar los puntos
tmR=[0;15.98;38.73;75.56;114.52];%son los timpo que midieron
tmC=[0;19.57;42.58;77.43;108.46];
vmC=reshape(0:5:20,5,1);
vmR=reshape(30:-5:10,5,1);

%configuración de ejes
set(gca,"xtick",[0:10:120]);
set(gca,"ytick",[-5:5:30]);
a=get(gcf,"currentaxes");
set(a,"fontsize",8,"linewidth",1.5);
xlabel("Tiempo(s)","fontsize",10,"fontname","Times New Roman","fontweight","bold");
ylabel("Voltaje(V)","fontsize",10,"fontname","Times New Roman","fontweight","bold");

%Titulo
%t=title("Grafica Teórica V_c = f(t)");
%t=title("Gráfica por Interpolación V_c = f(t)");
t=title("Gráficas Ajustadas y Suma de las ddp");
set(t,"fontname","Times New Roman","fontsize",11,"fontweight","Normal");

%ploteo de la función
%fplot(f1,[0,110],"linewidth",1.5);

%ploteo de la comparación
fplot(f1,[0,120],"linewidth",1.5);
fplot(f2,[0,120],"linewidth",1.5);
fplot(f3,[0,120],"linewidth",1.5);

%leyenda
legend("Función Ajustada-C", "Función Ajustada-R","Suma ddp");
set(legend,"position",[0.48,0.68,0.01,0.01],"fontname","Times New Roman","fontsize",9.5,"box","on");

%obtención de los datos;
%Datos(:,1)=vmR;
%Datos(:,2)=f1(tmR);
%Datos(:,3)=f2(tmR);

%ploteo puntos función teórica
%plot(tmR,Datos(:,2),"markersize",10,"marker",".","linestyle","none","color","k","displayname","Valores Teóricos");

%ploteo de los puntos muestra
plot(tmR,vmR,"markersize",10,"marker",".","linestyle","none","color","k","displayname","Valores Resistor");

%ploteo puntos Funcion ajustada
plot(tmC,vmC,"markersize",10,"marker",".","linestyle","none","color","r","displayname","Valores Capacitor");

%ploteo raiz de la suma de ddp

plot(raizsumaddp,0,".m","markersize",10,"displayname","Raiz Suma ddp");

legend("hide");
%guardado de la figura

%saveas(hf, "TeoricaCapacitor.png","png");
%saveas(hf, "TeoricaCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.jpg","jpg");
%saveas(hf, "InterpolacionCapacitor.png","png");
saveas(hf, "ComparacionRC.png","png");
saveas(hf, "ComparacionRC.jpg","jpg");

%Exportación de los datos
%f=fopen("CargaR.txt","w");
%fprintf(f,"Puntos Muestra    Valores Tóricos         Valores Ajustados\n");
%fprintf(f,"%d %d %d %d %d\n",Datos);
%fclose(f);