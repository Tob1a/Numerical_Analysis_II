close all
clear all
clc
N = 50000; % Campioni per l'integrale esterno
M = 50000; % Campioni per l'integrale interno
punti = rand(N, 1);
stima_integrale = 0;

for j = 1:N
    x_j = punti(j);
    y_i = x_j * rand(M, 1); % Campioni y ~ U(0, x_j)
    f_inner = y_i ./ (1 + x_j * y_i);
    I_xj = x_j * mean(f_inner); % Stima integrale interno
    stima_integrale = stima_integrale + I_xj;
end

stima_integrale = stima_integrale / N