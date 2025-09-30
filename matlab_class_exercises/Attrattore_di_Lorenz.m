% ATTRATTORE DI LORENZ - SCRIPT COMPLETO CON MIGLIORAMENTI GRAFICI
close all
clear all
clc
% Parametri del sistema Lorenz
sigma = 10;
rho = 28;
beta = 8/3;

% Equazioni differenziali del sistema
lorenz = @(t, state)[
    sigma * (state(2) - state(1));
    state(1) * (rho - state(3)) - state(2);
    state(1) * state(2) - beta * state(3)
];

% Condizioni iniziali e intervallo temporale
tspan = [0 40];
state0 = [1; 1; 1];

% Risoluzione numerica con ode45
[t, states] = ode45(lorenz, tspan, state0);

% Estrazione delle variabili
x = states(:,1);
y = states(:,2);
z = states(:,3);

% Colori dinamici in base al tempo (opzionale)
c = linspace(0, 1, length(t));

% Plot 3D migliorato
figure('Color','w')  % Sfondo bianco
scatter3(x, y, z, 5, c, 'filled')  % Colore variabile nel tempo
colormap(turbo)  % Mappa colori accattivante
colorbar
title('Attrattore di Lorenz','FontSize',14)
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
zlabel('Z','FontSize',12)
grid on
view(45, 25)  % Vista angolata 3D
axis tight
