function [R,k,itf,vett_val]=romberg(f,a,b,tol,m)

h=b-a;
R(1,1)=h/2*feval(f,a)+feval(f,b);
vett_val=[a,b];
itf=2;
%M e' il numero delle righe
for k=2:m
    %La mia tabella e' costruita per righe
    R(k,1)=0.5*(R(k-1,1)+h*sum(feval(f,a+h/2:h:b-h/2))); %quello che faccio e' partire da a+h/2 e andare fino a b-h/2 con passo h 
    itf=itf+2^(k-2);
    vett_val=[vett_val, a+h/2:h:b-h/2];
    for i=2:k
        %adesso lavoro sulla riga i
        R(k,i)=(4^(i-1)*R(k,i-1)-R(k-1,i-1))/(4^(i-1)-1);
    end
    if(abs(R(k,k)-R(k-1,k-1))<=tol) %ho trovato la convergenza
        break
    end
    h=h/2; %aggiorno il passo
end
fprintf("Non ho trovato la convergenza\n");
    

