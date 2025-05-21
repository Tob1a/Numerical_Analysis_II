close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

%% verifica 
f=@(x)1./(x.^2+1);

a=-5; b=5;

f=@(x)exp(-x.^2);
a=0;b=2;
sol=2*atan(5);
k1=15;
err=zeros(k1-1,4);
fprintf('Rettangoli\n');
for k=2:k1
    n=2^(k-1);
    [ir,itfr]=rettangoli(f,a,b,n);
    err(k-1,1)=abs(ir-sol);
    fprintf('n=%d  i=%g    itf=%d\n',n,ir,itfr);
end
pause
fprintf('Trapezi\n');
for k=2:k1
    n=2^(k-1);
    [it,itft]=trapezi(f,a,b,n);
    err(k-1,2)=abs(it-sol);
    fprintf('n=%d  i=%g    itf=%d\n',n,it,itft);
end
pause
fprintf('Cavalieri-Simpson\n');
for k=2:k1
    n=2^(k-1);
    [is,itfs]=simpson(f,a,b,n);
    err(k-1,3)=abs(is-sol);
    fprintf('n=%d  i=%g    itf=%d\n',n,is,itfs);
end
pause
fprintf('Punto medio\n');
for k=2:k1
    n=2^(k-1);
    [im,itfm]=puntomedio(f,a,b,n);
    err(k-1,4)=abs(im-sol);
    fprintf('n=%d  i=%g    itf=%d\n',n,im,itfm);
end
for j=2:k-1 %calcolo dell'errore
    r(j,:)=err(j-1,:)./err(j,:); %sono i rapporti tra una certa suddivisione / l'errore alla prossima suddivisione doppia
end

fprintf('  n\t  err rett   R  \t  err trapezi  R \t  err Simp R \n  err p.medio   R\n ');
for j=1:k1-1
    n=2^j;
    if j==1
           fprintf('  %d \t %g \t \t  \t  %g  \t \t  \t  %g  \t  \t  \t  %g   \n',...
            n,err(j,1),err(j,2),err(j,3),err(j,4));
    else
        fprintf('  %d \t %g  %g \t  %g  %g  \t  %g  %g \t  %g  %g \n',...
            n,err(j,1),r(j,1),err(j,2),r(j,2),err(j,3),r(j,3),err(j,4),r(j,4));
    end
end