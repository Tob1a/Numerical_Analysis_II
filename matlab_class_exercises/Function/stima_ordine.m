function [ordine,stima]=stima_ordine(xvect)
%    Commento:
%
%    Stima ordine e costante asintotica di convergenza di un metodo 
%    iterativo per il calcolo degli zeri di una funzione utilizzando
%    le seguenti formule :
%           
%            | x_(k+1) - x_k |
%         ln ------------------
%            | x_k - x_(k-1) |                | x_(k+1) - x_k |
%    p = ---------------------------    c = -----------------------
%              | x_k - x_(k-1) |             | x_(k) - x_(k-1) |^p  
%        ln -----------------------
%            | x_(k-1) - x_(k-2) |
%
%
%
nit=length(xvect);
p=zeros(nit-1,1); %matrice dim nit-1 x 1
c=zeros(nit-1,1);

for i=3:nit-1
    diff1=norm(xvect{i+1}-xvect{i});	%a{} e' un array cel che puo' contere dati di tipo diverso tra loro 
    diff2=norm(xvect{i}-xvect{i-1});
    diff3=norm(xvect{i-1}-xvect{i-2});

    if abs(diff1)<=eps || abs(diff2)<=eps || abs(diff3)<=eps %eps e' la precisione di macchina
        p(i)=p(i-1); %approssimo il risultato al risultato piu' vicino nel caso il risultato sia piu' piccola della mia precisione di macchina
        c(i)=c(i-1); %lo faccio anche qui
    else
        num=log(diff1/diff2); %continuo a fare le mie operazioni
        den=log(diff2/diff3);
        p(i)=num/den;
        c(i)=diff1/diff2^p(i);
    end
end
    ordine=p(end);
    stima=c(end);
end