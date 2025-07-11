function [R,k,itf]=romberg_senza_richardson(f,a,b,tol)

h=b-a;
R(1,1)=h/2*feval(f,a)+feval(f,b);
itf=2;
hprec=h;
%M e' il numero delle righe
for k=2:inf
    %La mia tabella e' costruita per righe
    R(k,1)=0.5*(R(k-1,1)+hprec*romberg_sum_term(f, a, h, k));
    itf=itf+2^(k-2);
    if(abs(R(k,1)-R(k-1,1))<=tol) %ho trovato la convergenza
        fprintf("Ho trovato la convergenza\n");
        return
    end
    hprec=h;
    h=h/2; %aggiorno il passo
end
fprintf("Non ho trovato la convergenza\n");
k=null;

    

