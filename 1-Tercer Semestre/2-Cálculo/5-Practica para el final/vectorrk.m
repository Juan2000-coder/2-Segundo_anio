##FUNCION RUNGE KUTTA VECTORES OH3
function vectorrk
#==================================Datos Alumno=============================================================================================================#  
 disp('Alumno: Miranda Francisco')
 disp('Legajo: 13250')
#==================================Inicio de programa=======================================================================================================#  
Dt=10;
Dx=0.55/5;
h=Dt;
p=300;
T=22.798*(10^-5);
td=1000;
tf=5000;
xi=0;
yi=[0 ;
    0 ;
    0 ;
    0 ];
w=1   ; ##Euler Modificado
N =501;
  
  ##Datos
    ##Absisas
          X=zeros(N,1);;
          X(1)= xi;
        for i=2:N
          X(i)=X(i-1)+h;
        end  
    ##Ordenadas
          Y=zeros(4,N);
    ##Valores iniciales en x0
          Y(:,1)=yi;
     
    ##Desarrollo
        for i=2:N
           k1 = dydx(X(i-1),Y(:,i-1));
           k2 = dydx((X(i-1) + (h/(2*w))) , (Y(:,i-1)+((h*k1)/(2*w))));
           Y(:,i)=Y(:,i-1)+((1-w)*k1+(w)*k2)*h ;
        end
        
      ##Entrega de datos
           disp('  ')
           fprintf('El valor de las Absisas es: %d\n',X(301))
           fprintf('El valor de la funcion solucion Z1 es: %d\n',Y(1,301))
           fprintf('El valor de la funcion solucion Z2 es: %d\n',Y(2,301))
           fprintf('El valor de la funcion solucion Z3 es: %d\n',Y(3,301))
           fprintf('El valor de la funcion solucion Z4 es: %d\n',Y(4,301))
#=========================================================================================================================================#              
    ##Grafico     
   hold on; grid on; 
        plot(X,Y(2,:),'-r',X,Y(4,:),'-g')
        xlabel('Absisas')  
        ylabel('Ordenadas')
        title ('Sistema Runge Kutta') 
        disp('    ')  
        disp('Alumno: Miranda Francisco')
        disp('Legajo: 13250')
        disp('    ')
#=========================================================================================================================================#              
  ##Grafico Gt
   G=zeros(N,1);
   for i=1:N;
     td=1000;
     vx=X(i,1);
     if vx<=td;
       G(i)=[vx/td];
##     elseif vx>=td & vx<=(2*td);
##       G(i)=[1-(vx-td)/(2*td)];
     else
       G(i)=1;
     end
   end
    
    plot(X,G(:,1),'b')
 endfunction

#=========================================================================================================================================#   
       
##FUNCION PENDIENTE
function [fx] = dydx(x,t)
               Dx=(0.55/5);
               T=22.798*(10^-5);
               p=300;
               td=1000;
               tf=5000;

               kaux1=(T/(Dx^2));
               K=[-2   , 1  ,  0    ,  0    ;
                  1    , -2 ,  1    ,  0    ;
                  0    , 1  ,  -2   ,  1    ;
                  0    , 0  ,  2/3  ,  -2/3 ] ;
               Z=t;
               kaux2=((p*T)/(Dx^2))  ;
               P=[-1 ;
                   0 ;
                   0 ;
                   0 ];
               vx=x;
              if x<=td;
                  gx=[vx/td];
                  fx=kaux1*K*Z+kaux2*P*gx ;
##              elseif x>=td & x<=(2*td);
##                  gx=[-vx/(2*td)];
##                  fx=kaux1*K*Z+kaux2*P*gx ;
              else
                  gx=1;
                  fx=kaux1*K*Z+kaux2*P*gx ;
              end
end
          

