close all
clear all
clc
%%%metodo di matlab per risolvere equazioni non lineari
myfun=@(x)[2*x(1)-x(2)-exp(-(x(1))); -x(1)+2*x(2)-exp(-x(2))];
x0=[-5;-5];
[x,fval]=fsolve(myfun,x0)

option=optimoptions();