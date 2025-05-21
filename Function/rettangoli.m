function [i,itf]=rettangoli(f,a,b,n)
%% formula composta dei rettangoli
%%

h=(b-a)/n;
x=linspace(a,b,n+1); % devo dare i valori equispaziati
i=sum(feval(f,x(1:n)))*h;%ho bisogno di calcolare tutti i valori della funzioni in tutti i nodi tranne nell'ultimo
itf=n; %complessita' computazionale