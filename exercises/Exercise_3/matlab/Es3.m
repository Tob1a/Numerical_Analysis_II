close all
clear all
clc


% intervallo di integrazione
a = 0; 
b = 4;
i = 200;                        % numero di passi
x = linspace(a,b,i+1);           % griglia

% condizioni al contorno
y0 = 1.25;                       % y(0)
yb = -0.95;                      % y(4) (target)

% funzione residuo per la secante
F = @(s) shooting_residual(s, x, y0, yb);

% -------------------------------
% metodo della secante
s0 = 0;            % guess 1
s1 = 0.2;          % guess 2 (puoi cambiare)
tol = 1e-10;       % tolleranza
maxit = 50;

for k = 1:maxit
    f0 = F(s0);
    f1 = F(s1);
    s2 = s1 - f1*(s1-s0)/(f1-f0);
    fprintf('Iter %d: s = %.12f, F(s) = %.6e\n', k, s1, f1);

    if abs(s2-s1) < tol
        break;
    end
    s0 = s1;
    s1 = s2;
end
s_star = s2;
fprintf('Pendenza iniziale trovata: s = %.12f\n', s_star);

% -------------------------------
% integrazione finale con s_star
Y0 = [y0; s_star];
[Y] = rk4(@f_ode, Y0, x);

% soluzione esatta
y_exact = (29/380)*x.^3 - 0.5*x.^2 + (87/380)*x + 1.25;

% grafico
plot(x, Y(:,1), 'b-', 'LineWidth',1.5); hold on;
plot(x, y_exact, 'r--', 'LineWidth',1.5);
plot(4, yb, 'ko', 'MarkerFaceColor','k');
xlabel('x'); ylabel('y(x)');
title('Confronto soluzione numerica (shooting RK4) vs esatta');
legend('Numerica (shooting RK4)', 'Soluzione esatta', 'Location','Best');
grid on;
