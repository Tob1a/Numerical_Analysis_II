close all
clear all
clc

% Definizione del problema
f = @(x, y) -34 * y;  % Funzione derivata
y0 = 1;               % Condizione iniziale
a = 0;                % Estremo sinistro
b = 1;                % Estremo destro

% Passi da confrontare
h_values = [1/14, 1/4, 0.05];

% Inizializzazione delle figure
figure('Position', [100, 100, 1200, 800]);

for i = 1:length(h_values)
    h = h_values(i);
    
    % Creazione della griglia temporale
    x = a:h:b;
    if x(end) ~= b
        x = [x, b];  % Assicura che l'ultimo punto sia esattamente b
    end
    
    % Applicazione del metodo RK3
    y_rk3 = rk3(f, y0, x);
    
    % Applicazione della regola trapezoidale
    y_trap = trapezoidal(f, y0, x);
    
    % Soluzione esatta
    y_exact = exp(-34 * x);
    
    % Calcolo degli errori
    error_rk3 = abs(y_exact - y_rk3');
    error_trap = abs(y_exact - y_trap');
    
    % Plot delle soluzioni
    subplot(3, 2, 2*i-1);
    plot(x, y_rk3, 'b-o', x, y_trap, 'r-s', x, y_exact, 'k--', 'LineWidth', 1.5);
    legend('RK3', 'Trapezoidale', 'Esatta');
    title(sprintf('Soluzioni (h = %.4f)', h));
    xlabel('x');
    ylabel('y');
    grid on;
    
    % Plot degli errori
    subplot(3, 2, 2*i);
    semilogy(x, error_rk3, 'b-*', x, error_trap, 'r-*', 'LineWidth', 1.5);
    legend('RK3', 'Trapezoidale');
    title(sprintf('Errori (h = %.4f)', h));
    xlabel('x');
    ylabel('Errore');
    grid on;
    
    % Stampa degli errori massimi
    fprintf('h = %.4f:\n', h);
    fprintf('  Errore max RK3: %e\n', max(error_rk3));
    fprintf('  Errore max Trapezoidale: %e\n\n', max(error_trap));
end
