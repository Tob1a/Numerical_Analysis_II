close all
clear
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

%guardati PECE prima


sis=@(x,y)([9 24;-24, -51]*y+[5*cos(x)-1/3*sin(x); -9*cos(x)+1/3*sin(x)]); % lo prendo come valore colonna
y0=[4/3 2/3];
p=1;

options=odeset('RelTol',1e-6);
[T,Y]=ode113(sis,[0,1],y0,options);

u1=2*exp(-3*T)-exp(-30*T)+1/3*cos(T);
u2=-exp(-3*T)+2*exp(-30*T)-1/3*cos(T);
plot(T,u1,'r', T, u2, 'b');
legend('u1','u2');title('soluzioni esatte');
figure
plot(T,Y(:,1),'b-',T,Y(:,2),'-r'); hold on; 
plot(T,zeros(size(T)),'+r')
legend('y1','appr','y2 appr');
title('Soluzioni con ode113');
fprintf('errore finale = %g     \n',abs(u1(end)-Y(end,1)),abs(u2(end)-Y(end,2)));

