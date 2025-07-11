function F = funzione(s,x,alpha,beta)%x e' la discrettizazione e alpha sono i valori iniziali e il beta serve per la funzione
%funzione Summary of this function goes here
%   Serve a risolvere il problema di cauchy
sis=@(x,y)[y(2),3/2*y(1).^2];
y0=[alpha,1];
y=rk4(sis,y0,x);
f(i)=y(end,1)-beta;
F=y(end)
end