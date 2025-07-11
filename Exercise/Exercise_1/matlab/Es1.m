close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%%

%%
% Definizione della funzione di iterazione di punto fisso PER IL SISTEMA
g = @(x) [sqrt(4 - x(2)^2);  % x_{n+1} = sqrt(4 - y_n^2)
          1/x(1)];           % y_{n+1} = 1/x_n

% Soluzione esatta (calcolata analiticamente)
exact_x = sqrt(2 + sqrt(3));   % ~1.93185
exact_y = 1/exact_x;           % ~0.51764
sol = [exact_x; exact_y];

% Parametri di ingresso
x0 = [1.9; 0.7];  % Guess iniziale vicino alla soluzione
tol = 1e-6;
maxit = 60;

% Chiamata alla funzione fixed point (assunta implementata correttamente)
[x, it, iterati] = fixed(g, x0, maxit, tol);

% Calcolo residuo ed errore
fprintf('Iterazioni effettuate: %d \n Soluzione: [%.12f, %.12f]\n', it, x);
for i = 1:it+1
    res(i) = norm(iterati{i} - g(iterati{i})); % Residuo
    err(i) = norm(iterati{i} - sol, inf);      % Errore assoluto
end

% Plot residuo
figure;
semilogy(1:it+1, res, 'r*-');
title('Residuo vs iterazioni');
xlabel('Iterazioni'); ylabel('||x_k - g(x_k)||');

% Plot errore
figure;
semilogy(1:it+1, err, 'b*-');
title('Errore assoluto vs iterazioni');
xlabel('Iterazioni'); ylabel('||x_k - x^*||_{inf}');

% Stima ordine di convergenza
[p, C] = stima_ordine(iterati); 
fprintf('Ordine stimato: %.3f \t Costante asintotica: %.3f\n', p, C);