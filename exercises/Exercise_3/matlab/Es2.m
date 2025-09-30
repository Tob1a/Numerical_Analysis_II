close all
clear all
clc

% Definizione funzione p(z)
pz = @(x)( x.^3 + 3*x.^2 + 6*x + 12);

% Derivata p'(z)
dpz= @(x)(3*x.^2 + 6*x + 6);


% Chiamata al metodo di Newton globale
x0 = -4;           % punto iniziale (es. vicino a una radice reale)
tolx = 1e-10;
tolf = 1e-10;
maxit = 100;

[x,it,iterati,merito] = sis_newton_glob(pz, dpz, x0, tolx, tolf, maxit);
fprintf('Radice trovata: %.12f in %d iterazioni\n', x, it);
