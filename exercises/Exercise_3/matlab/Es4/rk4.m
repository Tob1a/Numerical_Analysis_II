% Implementazione del metodo di Runge-Kutta a 4 stadi
function y = rk4(f, y0, x)
    % x sono il nodo iniziale + tutta la discretizzazione
    % metodo di Runge-Kutta a 4 stadi di ordine 4
    % struttura di y: matrice length(x) x n. di componenti di y
    y = zeros(length(x), length(y0));
    y(1,:) = y0;
    n = length(x);
    
    for i = 1:n-1
        h = x(i+1) - x(i);
        K1 = f(x(i), y(i,:)');
        x12 = x(i) + h/2;
        K2 = f(x12, y(i,:)' + h/2 * K1);
        K3 = f(x12, y(i,:)' + h/2 * K2);
        K4 = f(x(i+1), y(i,:)' + h * K3);
        y(i+1,:) = y(i,:) + h/6 * (K1 + 2*K2 + 2*K3 + K4)';
    end
end