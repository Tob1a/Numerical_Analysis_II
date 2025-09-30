function y = rk3(f, y0, x)
% x contiene il nodo iniziale + tutta la discretizzazione
% Metodo di Runge-Kutta a tre stadi specificato
% Struttura di y: matrice length(x) x n. componenti di y

y(1, :) = y0;
n = length(x);

for i = 1:n-1
    h = x(i+1) - x(i);
    
    % Calcolo degli stadi
    K1 = feval(f, x(i), y(i, :));
    K2 = feval(f, x(i) + h/2, y(i, :) + (h/2) * K1);
    K3 = feval(f, x(i) + (3*h)/4, y(i, :) + (3*h)/4 * K2);
    
    % Aggiornamento della soluzione
    y(i+1, :) = y(i, :) + (h/9) * (2*K1 + 3*K2 + 4*K3);
end
end