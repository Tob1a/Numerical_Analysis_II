Quando la mia funzione 
$$
	g(x)=x
$$
Possiamo usare il seguente codice per calcolare il punto fisso di una funzione non lineare:
```matlab
function  [x,it,iterati]=fixed(g,x0,maxit,tol);
% g e' la mia funzione
% x0 e' il punto iniziale, cioe' il primo approssimato
% maxit e' il numero di iterazione da eseguire 
% tol e' la tolleranza che non devo superare
x=x0(:);
iterati{1}=x;
for it=1:maxit
    x1=feval(g,x); %feval serve per calcolare la nuova approssimazione iterata
    iterati{it+1}=x1;
    if norm(x1-x,inf)<=eps+tol*norm(x,inf)
        break
    end
    x=x1;
end
% it contiene il numero di iterazioni
% x contiene l'ultimo valore calcolato
% iterati e' un array che contiene la sequenza degli approssimati ad ogni iterazione
```

Per calcolare un fixed point dobbiamo fare cosí:

Ho una convergenza quando il mio valore attuale (x) meno il precendente (x1) è minore della tolleranza;