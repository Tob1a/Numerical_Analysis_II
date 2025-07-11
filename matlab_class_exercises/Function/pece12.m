function [x,y]=pece12(f,y0,x0,x1,h,p)
%% P(EC)^pE
%%%%%%%%%%%%%%%%%
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
for i=1:n
    %eulero
    k1=feval(f,x(i),y(i,:));
    y(i+1,:)=y(i,:)+h*k1;
    %trapezzi
    for k=1:p
        y(i+1,:)=y(i,:)+h/2*(k1+feval(f,x(i+1),y(i+1,:)));
    end
end
x=x';



