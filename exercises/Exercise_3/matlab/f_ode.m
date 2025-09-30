function dydx = f_ode(x,y)
    % y(1) = y1 = y, y(2) = y2 = y'
    dydx = zeros(1,2);
    dydx(1) = y(2);
    dydx(2) = (2*x/(1+x^2))*y(2) - (2/(1+x^2)) + 1;
end