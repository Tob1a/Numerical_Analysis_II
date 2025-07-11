function [i,it]=simpson1(f,a,b,n)
%% formula composta di Cavalieri-Simpson bidimensionale
%%
if mod(n,2)== 0 %se il mio numero e' pari allora posso usare simpson
    h=(b-a)/n;
    x=linspace(a,b,n+1); % devo dare i valori equispaziati
    for i=1:n+1 %devo chiamare simpson in una cosa bidimensionale 
        f1(i)=feval(f,x(i));%devo calcolare il valore di ogni nodo
    end
    i=h/3*(f1(1)+f1(n+1)+4*sum(f1,(2:2:n))+2*sum(f1(3:2:n-1)));
    it=n+1; %complessita'
else
    fprintf("Il numero dei sottointervalli deve essere pari\n");
end