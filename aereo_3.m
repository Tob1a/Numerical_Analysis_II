close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

A= [
    -3.933 0.107 0.126 0 -9.99 0 -45.83 -7.64;
    0 -0.987 0 -22.95 9 -28.37 0 0;
    0.002 0 -0.235 0 5.67 0 -0.921 -6.51;
    0 1.0 0 -1.0 0 -0.168 0 0;
    0 0 -1.0 0 -0.196 0 -0.0071 0;
    ];

%x1=velocita' di rollio
%x2=velocita' di beccheggio
%x3=velocita' di imbardata
%x4=angolo di attacco
%x5=angolo di derapata
%x6=controlli di deviazione
%x7=controlli di alettone
%x8=controlli di timone
A1=A(1:5,1:5);
A2=A(1:5,6:8);

psi = @(w) [ -0.727*w(2)*w(3) + 8.39*w(3)*w(4) - 684.4*w(4)*w(5) + 63.5*w(4)*w(2);
             0.949*w(1)*w(3) + 0.173*w(1)*w(5);
            -0.716*w(1)*w(2) - 1.578*w(1)*w(4) + 1.132*w(4)*w(2);
            -w(1)*w(5);
             w(1)*w(4)];

jac=

% Example control inputs (replace with actual values)
u = [1; 0.2; 0.5]; % [x6; x7; x8]


f=@(w)(-inv(A1)*(A2*u+psi(w)));

x0=zeros(5,1);

maxit=100;
tol=1e-16;

[x,it,iterati]=fixed(f,x0,maxit,tol);
[x,it,iterati]=sis_newton(es1,jac_es1,x0,tolx,tolf,maxit);



% Output the result
disp('Computed state vector w:');
fprintf('n. di iterazioni=%d \nx=[%g %g %g %g %g]\n',it,x);
for i=1:it+1
    fu(i)=norm(iterati{i}-f(iterati{i}));
end
semilogy(1:length(iterati), fu,'r*-'); %semilogy è un grafico con la scala logaritmica
title('residuo in norma euclidea versus iterazioni');