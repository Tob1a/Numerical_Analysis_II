function [x,y]=adam_bash2(f,y0,x0,x1,h)
%x0 primo punto della discretizzazione
%x1 ultimo punto
%usano passo costante (h)

y(1,:)=y0; %come primo elemento metto y0
n=fix((x1-x0)/h); %metto il fix perche' non sono sicuro sia un intero
x=linspace(x0,x1,n+1);
%%%%%%%%%%%%%%%
%ho bisogno di un metodo ausiliaro di tipo iterattivo che non deve essere
%di ordine inferiore a quello che sto utilizzando (in questo caso del II
%ordine)
%prendo il metodo di eulero migliorato per trovarmi l'approssimazione al
%punto successivo
k1=feval(f,x0,y0);
y(2,:)=y(1,:)+h/2*(k1+feval(f,x(2),y(1,:)+h*k1)); %eulero
%%%%%%%%%%%%%%%%
%ora parto col metodo multipasso
%vedi formula slide numero 9 di 43
for i=3:n+1
    k2=feval(f,x(i-1),y(i-1,:));
    y(i,:)=y(i-1,:)+h/2*(3*k2-k1);
    k1=k2;%lo metto per risparmiarmi il calcolo di 1 punto
end



