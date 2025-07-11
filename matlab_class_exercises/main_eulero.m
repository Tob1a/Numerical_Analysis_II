close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%%%%%
%ben condizionato o mal condizionato?
%assintonticamente stabile secondo Lyapunov 
f=@(x,y)(-y+x+1);
%sol=x+exp(-x);
y0=1;
y=eulero(f,y0,x);

for i=1:lenght(x)
    fprintf('riga %d, soluzione x:%g \nsoluzione esatta: %g\n soluzione y:%g\n errore:%g ',i,x(i),sol(i),y(i),abs(sol(i)-y(i)));
end
fplot(x,sol,'r',x,y,'*');
