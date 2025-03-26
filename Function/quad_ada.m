function [s1,itc,vet_val]=quad_ada(f,a,b,c,fa,fb,fc,tol,lev,maxlev)
%inizialmente fa e fb e fc non li abbiamo ancora calcolati man mano che
%vado avanti li ho.
%tol e' quando dice che siamo arrivati
%maxlex e' il numero massimo di iterazioni che posso fare dopodiche' non ha
%tanto senso 
%lev e' il numero di volte che mi sono richiamato
if lev==0
    c=(a+b)/2;
    fa=feval(f,a);
    fb=feval(f,b);
    fc=feval(f,c);
    itc=3;
    vet_val=[a,c,b];
    tol=10*tol;
end
h=c-a;
ss1=h/3*(fa+4*(fc+fb));
h=h/2;
d=a+h;
fd=feval(f,d);
e=c+h;
fe=feval(f,e);
if lev==0
    itc=itc+2;
    vet_val=[vet_val,d,e];
else
    itc=2;
    vet_val=[d,e];
end
ss2=h/3*(fa+4*fd+2*fc+4*fe+fb);
if abs(ss1-ss2)<=tol
    s1=ss2;
elseif lev<=maxlev
    tol=tol/2;
    lev=lev+1;
    [ss1,itc1,vet_val1]=quad_ada(f,a,c,d,fa,fc,fd,tol,lev,maxlev);
    [ss2,itc2,vet_val2]=quad_ada(f,a,c,d,fa,fc,fd,tol,lev,maxlev);
