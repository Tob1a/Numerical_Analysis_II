close all
clear
clc

f=@(x)(1./x);
tol=1e-5;m=inf;
b=2;a=1;

f
[R,k,itf,vett_val]=romberg(f,a,b,tol,m);
disp(R);
fprintf("Numero di valutazioni di funzioni = %d, con k=%d iterazioni\n",size(vett_val,2),k);

f=@(x)(1./(1+x.^2));b=1;a=-1;
f
[R,k,itf,vett_val]=romberg(f,a,b,tol,m);
disp(R);
fprintf("Numero di valutazioni di funzioni = %d, con k=%d iterazioni\n",size(vett_val,2),k);

f=@(x)(cos(x));b=2;a=0;
f
[R,k,itf,vett_val]=romberg(f,a,b,tol,m);
disp(R);
fprintf("Numero di valutazioni di funzioni = %d, con k=%d iterazioni\n",2^(k-1)+1,k);

