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


% Example control inputs (replace with actual values)
u = [1; -0.5; 0.2]; % [x6; x7; x8]

g=@(x)(A1*x);

% Initial guess for w (x1 to x5)
x0 = zeros(5, 1);

% Iteration parameters
max_iter = 100;
tolerance = 1e-16;

A1()

[z,it,iterati]=fixed(g,x0,max_iter,tolerance);
fprintf('n. di iterazioni = %d \n x = [%g %g %g %g %g]\n\n',it,z);
