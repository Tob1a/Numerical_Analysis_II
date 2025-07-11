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
             w(1)*w(4) ]; 

% Example control inputs (replace with actual values)
u = [0.6; 0.1; 0.1]; % [x6; x7; x8]

% Initial guess for w (x1 to x5)
x0 = zeros(5, 1);
x0=[0.1,0.1,0.1,0.1,0.1];

% Iteration parameters
max_iter = 150;
tolerance = 1e-6;

f=@(x)((-A1)\(A2*u+psi(x)));

%ora usiamo il metodo di newton_globale
%per farlo ho bisogno della jacobiana della funzione
%la troviamo facendo:
% syms w1 w2 w3 w4 w5
% psi_sym = [ -0.727*w2*w3 + 8.39*w3*w4 - 684.4*w4*w5 + 63.5*w4*w2;
%             0.949*w1*w3 + 0.173*w1*w5;
%            -0.716*w1*w2 - 1.578*w1*w4 + 1.132*w4*w2;
%            -w1*w5;
%             w1*w4 ];
%J_phi=jacobian(psi_sym);
%J=A1+J_phi;
%che in function handle sarebbe:
J = @(w) [ -3933/1000, (127*w(4))/2 - (727*w(3))/1000 + 107/1000, (839*w(4))/100 - (727*w(2))/1000 + 63/500, (127*w(2))/2 + (839*w(3))/100 - (3422*w(5))/5, - (3422*w(4))/5 - 999/100;
                         (949*w(3))/1000 + (173*w(5))/1000, -987/1000, (949*w(1))/1000, -459/20, (173*w(1))/1000 + 9;
                         1/500 - (789*w(4))/500 - (179*w(2))/250, (283*w(4))/250 - (179*w(1))/250, -47/200, (283*w(2))/250 - (789*w(1))/500, 567/100;
                         -w(5), 1, 0, -1, -w(1);
                         w(4), 0, -1, w(1), -49/250 ];
%ora posso richiamare la mia formula per newton_globale

tolx=tolerance;
tolf=tolerance;
[x,it,iterati,merito] = sis_newton_glob(f,J,x0,tolx,tolf,max_iter);
disp('Computed state vector w:');
disp(x);
fprintf('Numero di iterazioni: %d\n',it);
%il sistema continua perche' entra in un minimo locale
