function [i,it]=simpson(f,a,b,n)
%% formula composta di Cavalieri-Simpson
%%
if mod(n,2)== 0 %se il mio numero e' pari allora posso usare simpson
    h=(b-a)/n;
    x=linspace(a,b,n+1); % devo dare i valori equispaziati
    f1=feval(f,x);%devo calcolare il valore di ogni nodo
    i=h/3*(f1(1)+f1(n+1)+4*sum(f1,(2:2:n))+2*sum(f1(3:2:n-1)));
    it=n+1; %complessita'
else
    fprintf("Il numero dei sottointervalli deve essere pari\n");
end