% calcolo del residuo per la secante
function r = shooting_residual(s, x, y0, yb)
    Y0 = [y0; s];
    Y = rk4(@f_ode, Y0, x);
    r = Y(end,1) - yb;   % differenza con la condizione a x=b
end