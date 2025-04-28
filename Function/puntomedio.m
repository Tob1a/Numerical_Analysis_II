function [i,it]=puntomedio(f,a,b,n)
%% formula composta del punto medio
%%
if mod(n,2)== 0 %se il mio numero e' pari allora posso usare la funzione del punto medio
    h=(b-a)/n;
    x=linspace(a,b,n+1); % devo dare i valori equispaziati
    f1=feval(f,x);%non devo calcolare il valore di ogni nodo, ma su ogni valore che sta in mezzo ai n nodi
    i=2*h*(sum(f1));
    it=n/2; %complessita'
else
    fprintf("Il numero dei sottointervalli deve essere pari\n");
end