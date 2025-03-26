clear all
close all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");
%%
g=@(x) [sqrt(-x(2)^2 +4); 1/x(1)];
sol=[0.11574647041495866187776141560711, 0.46150393460926706113391366090247]'% ground truth
%fsolve e long

x0=[0 0]';
tol=1e-16;
maxit=60;


[x,it,iterati]=fixed(g,x0,maxit,tol); %fixed è la funzione che mi permette di trovare il punto fisso di una funzione
fprintf('n. di iterazioni=%d x=[%g %g ]\n',it,x);
for i=1:it+1
    f(i)=norm(iterati{i}-g(iterati{i}));
    err(i)=norm(iterati{i}-sol,inf);
end
semilogy(1:length(iterati), f,'r*-'); %semilogy è un grafico con la scala logaritmica
title('residuo in norma euclidea versus iterazioni');
figure
semilogy(1:length(err), err,'r*-');
title('errore assoluto in norma inf versus iterazioni');
for i=2:it+1
    fprintf('k=%d  norm(x^k-x^*,inf)/norm(x^(k+1)-x^*,inf)=%g\n',...
        i,err(i)/err(i-1));
end
[p,C]=stima_ordine(iterati); 
fprintf('stima dell''ordine di convergenza=%g \n stima della costante asintotica=%g \n',p,C);
