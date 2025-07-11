close all
clear
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%slide 38 Ode3

% | y'_{1} (x) = 9y_{1} (x)+ 24y_{2} (x) +5*cos(x)-1/3*sin(x)
% | y_{2} (x) = -24y_{1} (x) -51y_{2} (x) -9*cos(x)+1/3*sin(x)

%y_{2}(x)

%dobbiamo vedere la stabilita' quindi la parte reale degli autovalori sia <=0
A=[9 24;-24, -51]; %matrice di stabilita'

sis=@(x,y)([9 24;-24, -51]*y'+[5*cos(x)-1/3*sin(x); -9*cos(x)+1/3*sin(x)])';
y0=[4/3 2/3];
p=1;
[x1,y1]=pece12(sis,y0,0,1,0.02,p);

u1=2*exp(-3*x1)-exp(-30*x1)+1/3*cos(x1);
u2=-exp(-3*x1)+2*exp(-30*x1)-1/3*cos(x1);
plot(x1,u1,'r', x1, u2, 'b');
legend('u1','u2');title('soluzioni esatte');
figure
plot(x1,y1(:,1),'b-',x1,y1(:,2),'-r'); legend('y1','appr','y2 appr');
title('Soluzioni con PECE12');
fprintf('errore finale = %g     \n',abs(u1(end)-y1(end,1)),abs(u2(end)-y1(end,2)));

