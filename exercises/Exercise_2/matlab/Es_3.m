close all
clear
clc

%qua per trapezzi per trovare il massimo 
z=@(x)(abs(4*x^2*exp(-x^2) - 2*exp(-x^2)));
[x_max, f_max_neg] = fminbnd(@(x) -z(x), -1, 1);
fprintf('Il massimo della funzione f'' e: %d\n\n', z(x_max));


%Romberg
f=@(x)(exp(-x.^2));
tol=1e-6; %la nostra tolleranza
a=0;b=2;
m=inf;%numero di righe
%si ferma lui quando trova la tolleranza giusta


[R,k,itf,vett_val]=romberg(f,a,b,tol,m);
disp(R)
fprintf("\nIl valore e' stato trovato dopo %d iterazioni e quindi dopo %d valutazioni di funzione\n",k,size(vett_val,2));
