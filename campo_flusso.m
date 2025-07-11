clear all
close all
clc
%% y'(x)=a*y(x)
%%%%%
a=1;
x=-0.5:0.05:0.5;
for c=-10:0.5:10%faccio variare la variabile c da -10 a 10 com passo 0.5
    y=c*exp(a*x);
    grid on
    plot(x,y);
    axis([-0.5 0.5, -15 15]);
    hold on
end
figure
a=-1;
x=-0.5:0.05:0.5;
for c=-10:0.5:10%faccio variare la variabile c da -10 a 10 com passo 0.5
    y=c*exp(a*x);
    grid on
    plot(x,y);
    axis([-0.5 0.5, -15 15]);
    hold on
end

%ad ogni punto e' associato un vettore tangente alla soluzione f(x^*,y^*)
