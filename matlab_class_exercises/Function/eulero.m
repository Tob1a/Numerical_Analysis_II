function y=eulero(f,y0,x)
%in x metto la mia discretizzazione del dominio
%fa la mia funzione
%x(1) = x0
%y e' una matrice con
%numero di righe e' uguale al numero di elementi della mia
%descritetizzazione (lenght(x))
y(1,:)=y0;
n=length(x);
for i=1:n-1
    h=x(i+1)-x(i);
    y(i+1,:)=y(i,:)+h*feval(f,x(i),y(i,:));
end