clear all
close all
clc

% Prima configurazione: A=2, B=0.02, C=0.0002, D=0.8
A1 = 2; B1 = 0.02; C1 = 0.0002; D1 = 0.8;
x0_1 = 3000; y0_1 = 120;
h=0.01;
t_span1 = 0:h:5; % Intervallo [0,5] con passo 0.01

% Definizione della funzione con parametri specifici
f1 = @(t, y) pred_prey(t, y, A1, B1, C1, D1);

% Risoluzione con Runge-Kutta
sol1 = rk4(f1, [x0_1; y0_1], t_span1);

% Grafico della fase (x,y)
figure;
plot(sol1(:,1), sol1(:,2));
xlabel('Prede (x)');
ylabel('Predatori (y)');
title('Modello Predatore-Preda - Primo Caso (A=2, B=0.02, C=0.0002, D=0.8)');
grid on;

% Seconda configurazione: A=B=C=D=1
A2 = 1; B2 = 1; C2 = 1; D2 = 1;
x0_2 = 4; y0_2 = 1;
t_span2 = 0:h:8; % Intervallo [0,8] con passo 0.01

% Definizione della funzione con parametri specifici
f2 = @(t, y) pred_prey(t, y, A2, B2, C2, D2);

% Risoluzione con Runge-Kutta
sol2 = rk4(f2, [x0_2; y0_2], t_span2);

% Grafico della fase (x,y)
figure;
plot(sol2(:,1), sol2(:,2));
xlabel('Prede (x)');
ylabel('Predatori (y)');
title('Modello Predatore-Preda - Secondo Caso (A=B=C=D=1)');
grid on;

