clear
clc
clf
close(gcf)
T=true;
%Variables necesarias
g=9.8;
%Interacción con el ususario
while T==true

alfausuario=input('Ingrese el ángulo con el que sale despedida la vagoneta (en grados):');
Lusuario=input('\n\nIngrese la longitud que debe recorrer la vagoneta (metros): ');
hprimausuario=input("\n\ningrese el valor para la altura del final del loop (h')(metros): ");
Husuario=input('\n\nIngrese la altura del inflable (metros): ');
masavagoneta=input('\n\nIngrese la masa de la vagoneta (kg): ');
fprintf('\n\n¿Que dato quiere conocer?\n\n')
n=input('\n\ningrese 1 para conocer la velocidad con la que sale despedida la vagoneta \n 2 para saber la altura total \n 3 para el radio del loop \n 4 para la fuerza ejercida por el inflable sobre la vagoneta \n y 5 para conocer todos los parametros anteriores\n\n ','s');
switch n;
    case '1'
        if alfausuario>=90 || alfausuario<=0 
            fprintf('\n\nCompa, son %.2f grados, la vagoneta no va a avanzar nada.\n\n Intenta con un ángulo mayor que cero y menor que 90 \n\n',alfausuario)
        elseif Lusuario<=0
             fprintf('Hermano, la longitud debe ser positiva, inténtalo de nuevo\n\n')
        else         
        disp('La velocidad a la que sale despedida la vagoneta es (metros sobre segundo):  ')
        velocidad=sqrt(g*Lusuario/(sind(2*alfausuario)))
        T=false;
        end

    case '2'
        if alfausuario>=90 || alfausuario<=0 
            fprintf('\n\nCompa, son %.2f grados, la vagoneta no va a avanzar nada.\n\n Intenta con un ángulo mayor que cero y menor que 90 \n\n',alfausuario)
        elseif Lusuario<=0
             fprintf('Hermano, la longitud debe ser positiva, inténtalo de nuevo\n\n')
        else         
        disp('La altura desde la que cae la vagoneta es (metros): ')
        altura_total=hprimausuario+Lusuario/(2*sind(2*alfausuario))
        T=false;
        end
    case '3'
        if alfausuario>=90 || alfausuario<=0 
            fprintf('\n\nCompa, son %.2f grados, la vagoneta no va a avanzar nada.\n\n Intenta con un ángulo mayor que cero y menor que 90 \n\n',alfausuario)
        elseif Lusuario<=0
             fprintf('Hermano, la longitud debe ser positiva, inténtalo de nuevo\n\n')
        else         
        disp('El radio del loop es (metros): ')
        altura_total=hprimausuario+Lusuario/(2*sind(2*alfausuario));
        radioloop=(2/5)*altura_total
        T=false;
        end
    case '4'
        if alfausuario>=90 || alfausuario<=0 
            fprintf('\n\nCompa, son %.2f grados, la vagoneta no va a avanzar nada.\n\n Intenta con un ángulo mayor que cero y menor que 90 \n\n',alfausuario)
        elseif Lusuario<=0
             fprintf('Hermano, la longitud debe ser positiva, inténtalo de nuevo\n\n')
        else         
        disp('La fuerza que ejerce el inflable sobre la vagoneta es (Newtons): ')
        F=F(masavagoneta,g,Lusuario,Husuario,alfausuario);
        F
        T=false;
        end

        
    case'5'
        if alfausuario>=90 || alfausuario<=0 
            fprintf('\n\nCompa, son %.2f grados, la vagoneta no va a avanzar nada.\n\n Intenta con un ángulo mayor que cero y menor que 90 \n\n',alfausuario)
        elseif Lusuario<=0
             fprintf('Hermano, la longitud debe ser positiva, inténtalo de nuevo\n\n')
        else         
        [alturatotal,radioloop,velocidad]=Lhprima(Lusuario,hprimausuario,alfausuario);
        disp('La altura desde la que cae la vagoneta es: ')
        alturatotal
        disp('El radio del loop es: ')
        radioloop
        disp('La velocidad a la que sale despedida la vagoneta es:  ')
        velocidad
        disp('La fuerza que ejerce el inflable sobre la vagoneta es (Newtons): ')
        F=F(masavagoneta,g,Lusuario,Husuario,alfausuario);
        F
        T=false;
        end
end
end



%Mediciones directas (variables independientes)
hprima=0.66987;
L=15;
alfao=30;
%Resultados (Variables dependientes)
h=hprima+L/(2*sind(2*alfao));
r=(2/5)*h;



xo=0;
yo=0;
% alfa=180:5:270;
% alfa2=270:10:630;
% alfa3=270:5:300;

%Primera caída 
t1=0:108;
thetao1=90;
serie=1+((1/2)^2)*(sind(thetao1/2))^2+((3/8)^2)*(sind(thetao1/2))^4+((15/48)^2)*(sind(thetao1/2))^6+((105/384)^2)*(sind(thetao1/2))^8 + ((945/3084)^2)*(sind(thetao1/2))^10;
w=sqrt(g/h)/serie;
alfa=thetao1*cosd(w*t1);
x=xo-h*sind(alfa);
y=yo-h*cosd(alfa);
plot(x,y,'Color','[0.3010 0.7450 0.9330]');
alturauno=line([-9.33012 -9.33012],[-9.33012 0],'Color','[0 0.4470 0.7410]','LineWidth',2);
hache='\bullet h';
puntohache=text(-9.63012,-4,hache,'Color','[0 0.4470 0.7410]','FontSize',13);
axis([-10 30 -9.43012 20]);
title('movimiento de la vagoneta');
grid on
hold on
%Segunda caída


xo2_3=0;
yo2_3=-5.59812;

t2_3=0:86;


thetao2_3=180;
serie2_3=1+((1/2)^2)*(sind(thetao2_3/2))^2+((3/8)^2)*(sind(thetao2_3/2))^4+((15/48)^2)*(sind(thetao2_3/2))^6+((105/384)^2)*(sind(thetao2_3/2))^8+((945/3084)^2)*(sind(thetao2_3/2))^10;
w2_3=sqrt(g/r)/serie2_3;

alfa2=-thetao2_3*sind(w2_3*t2_3);
x2=xo2_3-r*sind(alfa2);
y2=yo2_3-r*cosd(alfa2);

alfa3=thetao2_3*cosd(w2_3*t2_3);
x3=xo2_3-r*sind(alfa3);
y3=yo2_3-r*cosd(alfa3);

plot(x2,y2,'Color','[0.3010 0.7450 0.9330]')
hold on
plot(x3,y3,'Color','[0.3010 0.7450 0.9330]')

dosr='\bullet \leftarrow 2r';
puntodosr=text(-0.1,-2.05,dosr,'Color','[0 0.4470 0.7410]','FontSize',13);
%subida
alfa4=270:300;
xo4=xo;
yo4=yo;
x4=xo4+h*cosd(alfa4);
y4=yo4+h*sind(alfa4);
plot(x4,y4,'Color','[0.3010 0.7450 0.9330]');
alturados=line([4.66506 4.66506],[-9.63012 -8.08012],'Color','[0 0.4470 0.7410]','LineWidth',2);
hachedos="\bullet h'"; 
puntohachedos=text(4.46506,-9,hachedos,'Color','[0 0.4470 0.7410]','FontSize',13);
%salto------------------------------------------------------------

vo=sqrt((g*L)/sind(2*alfao));
vox=vo*cosd(alfao);
voy=vo*sind(alfao);
%Tiempo para la altura maxima
T1=voy/g;
alturamaxima=voy^2/(2*g)+hprima;
%Tiempo para el recorrido total
T2=2*voy/g;
recorridomaximo=(vo^2)*sind(2*alfao)/g; 
%Parametro (tiempo)
to=0;
tf=T2;
Npt=30;
dt=(tf-to)/Npt;
t=to:dt:tf;
%posicion inicial 
xo5=4.66506;
yo5=-8.08012;
x5=xo5+vox*t;
y5=yo5+voy*t-0.5*g*t.^2;
plot(x5,y5,'Color','k','LineStyle','--');

%Caida sobre inflable
%Altura del inflable
H=hprima;
%Fuerza que ejerce el inflable sobre la vagoneta
%Tiempo del deplazamiento vertical sobre el inflable
F=(masavagoneta*g*L)/(2*H*sind(2*alfao));
a=F/masavagoneta;
T3=vo/a;
Nit=50;
Npt2=Nit +1;
to3=0;
tf3=T3;
dt3=(tf3-to3)/Nit;
t3=to3:dt3:tf3;
%Altura incial
yo6=-8.08012 ;
y6=yo6-vo*t3+0.5*a*t3.^2;
x6=19.6651*ones(1,Npt2);
plot(x6,y6,'Color','k')
%Figura del inflable
xr=[18.5 18.5 21 21];
yr=[-9.33012 -8.18623 -7.88 -9.33012];
fill(xr, yr, [1 0.5 0])
%Animación

% Primera caída

for n=1:1:length(alfa)
    masa=plot(x(n),y(n),'k*','LineWidth',3);
    drawnow
    delete(masa);
end
%Segunda caída


for n=1:length(alfa2)
    m=plot(x2(n),y2(n),'k*','LineWidth',3);
    % radio=line([0 x2(n)],[0 y2(n)],'Color','k','LineWidth',1)
    hold on
    drawnow
    delete(m)
    % delete(radio)
end

for n=1:length(alfa3)
    m=plot(x3(n),y3(n),'k*','LineWidth',3);
    % radio=line([0 x3(n)],[0 y3(n)],'Color','k','LineWidth',1)
    drawnow
    delete(m)
    % delete(radio)
end

%subida
for n=1:1:length(alfa4)
    masa=plot(x4(n),y4(n),'k*','LineWidth',3);
    drawnow
    delete(masa)
end
%salto
for n=1:length(t)
    masa=plot(x5(n),y5(n),'k*','LineWidth',3);
    pause(0.03)
    drawnow
    delete(masa)
end
%Caída
for n=1:1:length(t3)
    masa=plot(x6(n),y6(n),'k*','LineWidth',3);
    pause(0.05)
    drawnow;
    delete(masa);
end

