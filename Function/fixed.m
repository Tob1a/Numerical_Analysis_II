function [x,it,iterati]=fixed(g,x0,maxit,tol)
%  g     funzione
%  x0    punto iniziale
%  maxit massimo numero di iterazioni
%  tol   tolleranza relativa
%
x=x0;
iterati{1}=x;
for it=1:maxit
    x1=feval(g,x);
    %fprintf('it=%g\n',it);
    %fprintf('x=%g \n',x);
    iterati{it+1}=x1; 
    if norm(x1-x,inf)<eps+tol *norm(x,inf) %convergenza raggiunta
        break
    end
    x=x1;  
end
end