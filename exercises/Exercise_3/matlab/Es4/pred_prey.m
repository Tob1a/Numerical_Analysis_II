% Definizione della funzione per il sistema predatore-preda
function dydt = pred_prey(t, y, A, B, C, D)
    x = y(1);
    y_val = y(2);
    dxdt = A*x - B*x*y_val;
    dydt = C*x*y_val - D*y_val;
    dydt = [dxdt; dydt];
end