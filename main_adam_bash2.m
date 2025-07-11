close all
clear
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%voglio risolvere il seguente sistema:
%y^iii (x)+2y^ii (x)-y^i (x)-2y (x)=e^x
%y(0)=1     y^i(0)=2    y^ii(0)=0

%lo voglio risolvere nell'intervallo 0,3
%con passo 0.01

sis=@(x,u)([0 1 0; 0 0 1; 2 1 -2]*u'+[0; 0; exp(x)])';
y0=[1 2 0];
x0=0;
x1=3;
h=0.01;
[x,y]=adam_bash2(sis,y0,x0,x1,h);
figure
plot(x,y(:,1),'b-',x,y(:,2),'r:',x,y(:,3),'m--');
