close all
clear 
clc
%%%
sis=@(x,y)[y(2),3/2*y(1).^2];
s=linspace(-100,0,60);
for i=1:length(s)
    %ora devo risolvere i vari problemi di couchy
    y0=[4,s(i)];
    x=linspace(0,1,20);
    y=rk4(sis,y0,x); %rounge-koutte di ordine 4
    f(i)=y(end,1)-1;
end
plot(s,f,'b',s,zeros(size(s)),'r');
title('funzione F');

%Ok ora so che a=-40 e b=-30 posso fare shooting
a=-40; b=-30;
fa=funzione(a,4,1,20); %f di a
fb=funzione(b,4,1,20); %f di b
%applico il metodo di bisezione
if abs(fc)<=tol
    sapp=c;
end
if fa*fb<0
    iter=fix(log2((b-a)/tol+0.5)); %mi viene un numero decimale ma mi serve un intero e quindi ci aggiungo 0.5 e fix
    c=a+(b-a)/2;
    fc=funzione(c,4,1,20); %f di b
    if fc*fa<0
        fb=fc;
        b=c;
    else
        fa=fc;
        a=c;
    end
    sapp=c;
else
    error('intervallo non corretto');
end
fprinft('valore di s=%g, it=%d\n',sapp,i);
%%%%%%
y0=[4,sapp];
x=linspace(0,1,20);
ys=rk4(sis,y0,x);
plot(x',ys(:,1),'or',x',ys(:,2),'*b'); %ys(:,2) e' la derivata di ys(:,1)
legend('y','y')