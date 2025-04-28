close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");


f=@(x)sin(x);
a=0;b=pi;
tol=1e-6;

m=7;
[R,k,itf,vett_val]=romberg(f,a,b,tol,m);

disp('Tabella di Romberg');
R

fprintf("Ordine di Acuratezza\n");
fprintf("   %14.10f     ",(pi./(2.^(0:k-1))).^(2:2:2*k));




x=linspace(0,pi,100);
y=f(x);
plot(x,y,'b',vett_val,zeros(size(vett_val)),'+r');
axis([a b -0.1 1.1]); grid on
