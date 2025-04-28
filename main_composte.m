close all
clear all
clc
addpath("/Users/tobiasacchetto/Documents/GitHub/Numerical_Analysis_II/Function");

%% verifica 
f=@(x)1.\x;
%int_1^2 1\x dx
a=1;a=2;
sol=log(2);
k1=10;
err=zeros(k1-1,4);

disp('Rettangoli')
for k=2:k1
    n=2^(k-1);
    [ir,itf]=rettangoli(f,a,b,n);
    err(k-1,1)=abs(ir-sol);
    fprintf('n=%d \t i=%g \t itf=%d\n',n,ir,itf);
end
pause

disp('Trapezi')
for k=2:k1
    n=2^(k-1);
    [ir,itf]=trapezzi(f,a,b,n);
    err(k-1,1)=abs(ir-sol);
    fprintf('n=%d \t i=%g \t itf=%d\n',n,ir,itf);
end
pause

disp('Cavalieri-Simpson')
for k=2:k1
    n=2^(k-1);
    [ir,itf]=simpson(f,a,b,n);
    err(k-1,1)=abs(ir-sol);
    fprintf('n=%d \t i=%g \t itf=%d\n',n,ir,itf);
end
pause

disp('Punto medio')
for k=2:k1
    n=2^(k-1);
    [ir,itf]=puntomedio(f,a,b,n);
    err(k-1,1)=abs(ir-sol);
    fprintf('n=%d \t i=%g \t itf=%d\n',n,ir,itf);
end
pause

for j=2:k-1 %calcolo dell'errore
    r(j,:)=err(j-1,:)./err(j,:); %sono i rapporti tra una certa suddivisione / l'errore alla prossima suddivisione doppia
end

fprintf('n\t err rett  R \t err trapezzi  R\t err Simpson \err p.medio  R\n');
for j=1:k1-1
    n=2^j;
    if j==1

    else
        fprintf('   %d \t %g    %g \t%g    %g \t%g    %g \t%g    %g \n',
        n,err(j,1),r(j,1));
    end
end