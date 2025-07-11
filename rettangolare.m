close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%%%%%%
a=0;b=1;c=-1;d=1;
f11=@(x,y)(cos(10*(x.^2+y)).*exp(y.^2+x));
x=linspace(a,b);
y=linspace(c,d);
[X,Y]=meshgrid(x,y); %numero delle x per il numero delle y
%X contiene tutte le coordinate dei punti sulla x e Y sulla y
surf(X,Y,f11(X,Y));
%per calcolare questa cosa devo usare simpson composto bidimensionale

t=100; % devo scegliere quanti punti
%t sarebbe xy
cal_int=@(x)simpson2(f11,c,d,t,x);
nx=50; %la formula di simpson non deve calcolarmi l'integrale in quel punto ma nel punto x y quindi io devo mettere la t che non si schioda dal punto
[i,itf]=simpson1(cal_int,a,b,nx);
fprintf('i=%g numerodivalutazionidifunzione=%d\n',i,t*nx); %itf=numero di chiamate a simpson2 ogni chiamata pesa t quindi 100


