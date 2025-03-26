function [i,it]=trapezi(f,a,b,n)
%% formula composta dei trapezi
%%

h=(b-a)/n;
x=linspace(a,b,n+1); % devo dare i valori equispaziati
f1=feval(f,x);%devo calcolare il valore di ogni nodo
i=h/2*(f1(1)+f1(n+1)+2*sum(f1,(2:n)));
it=n+1; %complessita'