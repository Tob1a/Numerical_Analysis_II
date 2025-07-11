close all
clear
clc

%%%%%%%%%%%%%%%%%
%               %
%% Esercizio 8 %%
%               %
%%%%%%%%%%%%%%%%%

f=@(x)(sin(pi/2 *(x+1)+1));
w=[0.347855 0.652145 0.652145 0.347855];
xi=[-0.861136 -0.339981 0.339981 0.861136];
risultato=0;
for i=1:4
    elemento=w(i)*f(xi(i));
    risultato=risultato+elemento;
end
risultato=pi/2 * risultato


errore=abs(2*cos(1)-risultato)

%2.0428e-04