function y=eulero_mod(f,y0,x)
%metodo di eulero esplicito modificiato o metodo espicito di Heun
% sono il nodo iniziale + tutta la discretizzazione

y(1,:)=y0;
n=length(x);
for i=1:n-1
    h=x(i+1)-x(i);
    k1=feval(f,x(i),y(i,:));
    y(i+1,:)=y(i,:)+h*feval(f, x(i)+h/2, y(i,:)+h/2*k1);
end