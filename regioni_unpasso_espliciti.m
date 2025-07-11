clear all
close all
clc
%%%%% 
%tabulo la x nella parte negativa del campo reale
x=linspace(-3.5,1);
y=linspace(-3,3);
[X,Y]=meshgrid(x,y);
Z=X+i*Y; %i e' la parte immaginaria
F=abs(Z+1);
contour(X,Y,F,[1,1],'r','LineWidth',3);
axis equal %serve per avere la stessa unita' di misura nell'asse x
grid on 
hold on


F=abs(Z^2/2+Z+1);
contour(X,Y,F,[1,1],'r','LineWidth',3);
axis equal %serve per avere la stessa unita' di misura nell'asse x
grid on 
hold on


F=abs(Z.^3/6+Z.^2/2+Z+1);
contour(X,Y,F,[1,1],'r','LineWidth',3);
axis equal %serve per avere la stessa unita' di misura nell'asse x
grid on 
hold on


F=abs(Z.^4/24+Z.^3/6+Z.^2/2+Z+1);
contour(X,Y,F,[1,1],'r','LineWidth',3);
axis equal %serve per avere la stessa unita' di misura nell'asse x
grid on 
hold on