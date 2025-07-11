close all
clear all
clc
n=5; %numero di nodi che prendo
a=-1; b=1; % sono la dimensione degli integrali
syms x
p0=1; % so gia quale e' il valore del polinomio di grado 0
sigma(1)=int(omega,x,a,b);%mu0 che e' l'integrale
rho(1)=int(omega*x,x,a,b)/sigma(1);
p1=x-rho(1);
sigma(2)=int(omega*p1^2,a,b); %mi calcolo mu1
%ora inizio a calcolarmi la formula della riccorenza
for i=2:n
    rho(i)=int(omega*x*p1^2,x,a,b)/sigma(i);
    tau(i)=sigma(i)/sigma(i-1);
    p2=(x-rho(i))*p1-tau(i)*p0;
    sigma(i+1)=int(omega*p2^2,x,a,b);

end

%siccome sono simbolici devo fare la trasformazione a numero di macchina
rho=double(rho);
delta=sqrt(double(tau));

%%% T tridiagonale
t0=rho';
t1=
T=spdiags(t0,n,n)%mi serve per calcolare la mia matrice nxn
%autovalori e autovettori vanno calcolati sono per valori full e quindi
%devo fare
eigs()
for i=1:n
    alpha= sqrt(V(:,i)'*V(:,i)/double(sigma(1))); %io ho vtilde e devo trovare alpha
    V(:,1)=alpha*V(:,i); 
    w(i)=V(1,i)^2; %il mio peso e a me serve solo il primo elemento della colonna gli altri sono soli 0
end
