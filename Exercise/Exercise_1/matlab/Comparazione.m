close all; clear all; clc;
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

%% Parametri comuni
maxit = 60;
sol = [sqrt(2 + sqrt(3)); 1/sqrt(2 + sqrt(3))]; % Soluzione esatta

%% Metodo di Newton
fprintf('============= METODO DI NEWTON =============\n');
% Definizione funzione e Jacobiano
f_newton = @(x) [x(1)^2 + x(2)^2 - 4; 
                x(1)*x(2) - 1];
J_newton = @(x) [2*x(1), 2*x(2);
                x(2),   x(1)];

% Parametri specifici
x0_newton = [0; 0.5];
tolx = 1e-6; 
tolf = 1e-6;

% Esecuzione metodo
[x_newton, it_newton, iterati_newton] = sis_newton(f_newton, J_newton, x0_newton, tolx, tolf, maxit);

% Calcolo metriche
for i = 1:it_newton+1
    res_newton(i) = norm(iterati_newton{i} - f_newton(iterati_newton{i}));
    err_newton(i) = norm(iterati_newton{i} - sol, inf);
end

%% Metodo del Punto Fisso
fprintf('\n============= METODO DEL PUNTO FISSO =============\n');
% Definizione funzione di iterazione
g_fixed = @(x) [sqrt(4 - x(2)^2); 
              1/x(1)];

% Parametri specifici
x0_fixed = [2; 0.5];
tol_fixed = 1e-6;

% Esecuzione metodo
[x_fixed, it_fixed, iterati_fixed] = fixed(g_fixed, x0_fixed, maxit, tol_fixed);

% Calcolo metriche
for i = 1:it_fixed+1
    res_fixed(i) = norm(iterati_fixed{i} - g_fixed(iterati_fixed{i}));
    err_fixed(i) = norm(iterati_fixed{i} - sol, inf);
end

%% Plot confronto residui
figure;
semilogy(0:it_newton, res_newton, 'ro-', 'DisplayName', 'Newton');
hold on;
semilogy(0:it_fixed, res_fixed, 'bs-', 'DisplayName', 'Punto Fisso');
title('Confronto Residui');
xlabel('Iterazioni'); ylabel('||x_k - g(x_k)||');
legend; grid on;

%% Plot confronto errori
figure;
semilogy(0:it_newton, err_newton, 'ro-', 'DisplayName', 'Newton');
hold on;
semilogy(0:it_fixed, err_fixed, 'bs-', 'DisplayName', 'Punto Fisso');
title('Confronto Errori Assoluti');
xlabel('Iterazioni'); ylabel('||x_k - x^*||_{\infty}');
legend; grid on;

%% Stima ordine di convergenza
[p_newton, C_newton] = stima_ordine(iterati_newton);
[p_fixed, C_fixed] = stima_ordine(iterati_fixed);

fprintf('\n============= RISULTATI =============\n');
fprintf('Newton: Ordine %.3f - Costante %.3f\n', p_newton, C_newton);
fprintf('Punto Fisso: Ordine %.3f - Costante %.3f\n', p_fixed, C_fixed);



