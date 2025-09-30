close all
clear all
clc 
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/matlab_class_exercises/Function");

h=0.1; %passo
x0=0; x1=4; %intervalli
x=x0:h:x1; %x esplicita
p = 2; %quanto voglio preciso il corrector
y0=1;
f=@(x,y)(-5*y+x);

%soluzione esatta
exact_sol=@(x)((5*x-1)/25+(24/25)*exp(-5*x));
exact_soll=arrayfun(exact_sol,x);
%chiamo eulero implicito / esplicito
[y_explicit,y_implicit]=eulero_implicito_mod(f,y0,x0,x1,h,p);
y_eulero=eulero(f,y0,x);




%% 3. CONFRONTO VISIVO DEI RISULTATI
figure;
plot(x, y_explicit, 'b-o', 'LineWidth', 1.5, 'DisplayName', 'Predictor(Eulero Esplicito)');
hold on;
plot(x, exact_soll, 'g-o', 'LineWidth', 1.5, 'DisplayName', 'Soluzione Esatta');
plot(x, y_implicit, 'r-s', 'LineWidth', 1.5, 'DisplayName', 'Corrector(Eulero Implicito) p=2');
plot(x, y_eulero, 'm-s', 'LineWidth', 1.5, 'DisplayName', 'Eulero Esplicito');
[y_explicit,y_implicit_p1]=eulero_implicito_mod(f,y0,x0,x1,h,1);
plot(x, y_implicit_p1, 'y-s', 'LineWidth', 1.5, 'DisplayName', 'Corrector(Eulero Implicito) p=1');
xlabel('x');
ylabel('y(x)');
title('Confronto tra metodi di Eulero');
legend('show');
grid on;


fprintf('\nPrimi 5 valori:\n');
fprintf('  i      x(i)     Esatta      Eulero Exp.   Predictor (p=2)   Corrector (p=2)   Corrector (p=1)\n');
fprintf('----------------------------------------------------------------------------------------------\n');
for i = 1:5
    fprintf('%3d   %7.2f   %9.5f   %10.5f     %10.5f       %10.5f       %10.5f\n', ...
        i, x(i), exact_soll(i), y_eulero(i), y_explicit(i), y_implicit(i), y_implicit_p1(i));
end

