close all
clear all
clc

%Calcolo derivata 8
% syms t
% f=sin(pi/2 *(t+1)+1);
% diff(f,8); 

%Trovo il massimo
z=@(x)((pi^8*sin((pi*(x + 1))/2 + 1))/256); %la mia derivata :)
[x_max, f_max_neg] = fminbnd(@(x) -z(x), -1, 1);
fprintf('Il massimo della funzione e: %d\n', z(x_max));
%Visualizzo la mia funzione
x_vals = linspace(-2, 2, 1000);
y_vals = z(x_vals); 
plot(x_vals,y_vals,'r');


%f=@(x)((1/8*(35*x^4-30*x^2+3))^2);
syms x
f=(1/8*(35*x^4-30*x^2+3))^2; %formula di legendre per il 4o grado
ris_int=int(f,x,-1,1); %risolvo l'integrale
errore=double(z(x_max)/factorial(8) * ris_int)

