close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

f=@(x,y)-1000*y+1000;

y0=10;
a=0;b=0.1;
x=linspace(a,b);
sol=1+9*exp(-1000*x);
plot(x,sol,'k-');hold on
%%%%%%%%
%RoungeKoutte 4
h=2.78/1000*0.8; %devo ridurre il passo e quindi lo devo moltiplicare per qualcosa per
%esempio 0.8
n=fix((b-a)/h);
disp('rk4');disp(h);
x=linspace(a,b,n+1);
y=rk4(f,y0,x);
plot(x,y,'mo--');
%%%%%%%%%
%Crank-Nicolson
h=2.78/1000*0.8;
n=fix((b-a)/h);
disp('crank-nicolson');disp(h);
x=linspace(a,b,n+1);
y1=crack-nicolson(f,y0,x0,x1,h,1);
plot(x0:h:x1,y1,'+b-');
%%%%%%%%%
%Come matlab affronta i problemi stiff
disp('ode15s');disp(h);
[T,Y]=ode15s(f,[a,b],y0);
plot(T,Y,'gd-'); legend('sol','eulero','rounge-koutte','cranck-nicolson','ode15s');