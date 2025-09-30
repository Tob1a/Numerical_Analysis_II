function y = trapezoidal(f, y0, x)
    % Regola trapezoidale
    n = length(x);
    y = zeros(n, 1);
    y(1) = y0;
    
    for i = 1:n-1
        h = x(i+1) - x(i);
        
        % Risoluzione implicita per y(i+1)
        % y(i+1) = y(i) + h/2 * [f(x(i), y(i)) + f(x(i+1), y(i+1))]
        % Per f(x,y) = -34y, possiamo risolvere esplicitamente:
        y(i+1) = y(i) * (1 - 17*h) / (1 + 17*h);
    end
end