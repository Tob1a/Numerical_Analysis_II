close all
clear 
clc

N=10000000;                  %numero di punti
f=@(x,y)(y./(1+x.*y));    %funzione da integrare

x=rand(N,1); 
y=rand(N,1);

ind=find(y<=x);    %cerco le coppie (x,y) che stanno nel mio dominio
x=x(ind);               
y=y(ind);
I = 0.5*sum(f(x, y)) / length(ind); %moltiplico 0.5 per la media di f

fprintf('I=%g\n',I);