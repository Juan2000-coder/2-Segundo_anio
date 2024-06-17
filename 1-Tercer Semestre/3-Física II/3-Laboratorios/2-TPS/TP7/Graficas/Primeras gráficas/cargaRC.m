%comparación de las graficas por interpolación para la resistencia y el capacitor
%en el rango mas grande de t, ose el de R.
1;
f1=@lagrangeC;
f2=@lagrangeR;


hf=figure(1);
hold on;grid on;

%vectores para graficar los puntos
tmC=[0;19.57;42.58;77.43;108.46];
tmR=[0;15.98;38.73;75.56;114.52];

%raix de la suma
f=@suma;
r = secante(80,100,f,0,100);

%configuración de ejes
set(gca,"xtick",[0,30,60,r,reshape(tmC,1,5),reshape(tmR,1,5)]);
set(gca,"ytick",[-5,reshape(f1(tmC),1,5),reshape(f2(tmR),1,5)]);
ylim([-5,30]);
a=get(gcf,"currentaxes");
set(a,"fontsize",10,"linewidth",1.5,"fontname","Times New Roman");
xlabel("t (s)","fontsize",10,"fontname","Times New Roman");
ylabel("Volts","fontsize",10,"fontname","Times New Roman");

%Titulo

t=title("Comparación de Gráficas");
set(t,"fontname","Times New Roman","fontsize",13,"fontweight","Normal");

%ploteo de la comparación
fplot("[lagrangeC(x),lagrangeR(x),suma(x)]",[0,120],"linewidth",1.5);

%leyenda
str={"Interpolación-C";"Interpolación-R";"g(t)"};
set(legend,"string",str);
set(legend,"position",[0.5,0.65,0.05,0.05],"fontname","Times New Roman","fontsize",8,"box","on");

%ploteo puntos primera funcion
plot(tmC,f1(tmC),"markersize",10,"marker",".","linestyle","none","color","k","displayname","Puntos Muestra-C");

%ploteo puntos segunda funcion
plot(tmR,f2(tmR),"markersize",10,"marker",".","linestyle","none","color","b","displayname","Puntos Muestra-R");

%ploteo de la raíz de la suma

plot(r,f(r),"markersize",10,"marker",".","linestyle","none","color","r","displayname","Ráiz de g");

%guardado de la figura
saveas(hf, "ComparacionRC.png","png");
saveas(hf, "ComparacionRC.jpg","jpg");