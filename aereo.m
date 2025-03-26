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
u = [0.3; 0.1; 0.1]; % [x6; x7; x8]

% Initial guess for w (x1 to x5)
w_old = zeros(5, 1);

% Iteration parameters
max_iter = 100;
tolerance = 1e-16;

tic;
% Fixed-point iteration
for iter = 1:max_iter
    psi_w = psi(w_old);
    rhs = A2 * u + psi_w;
    w_new = - (A1 \ rhs);  %sarebbe A1*w^(k+1)=-(A_2*u+psi(w^k))
    
    if norm(w_new - w_old) < tolerance
        fprintf('Convergenza raggiunta in %d iterazioni.\n', iter);
        break;
    end
    w_old = w_new;
end
tempo=toc;
% Output the result
disp('Computed state vector w:');
disp(w_new);
fprintf("Il tempo mio e' %g \n\n",tempo);

f=@(x)(-inv(A1)*(A2*u+psi(x)));
tic;
[x,it,iterati]=fixed(f,w_old,max_iter,tolerance);
tempo=toc;
disp('Computed state vector w:');
disp(x);
fprintf('Numero di iterazioni: %d\n',it);

fprintf("Il tempo di feval e' %g \n",tempo);