close all
clear all
clc

%%%
funz=@(x)(100*sin(10./x).*(1./x.^2));
a=1;
b=3;
punti=linspace(a,b);
yy=funz(punti);
plot(punti,yy,'b');
hold on
tol=1e-5;
lev=0;
c=0;fa=0;fb=0;fc=0;
[s1,itc,vet_val]=quad_ada(f,a,b,c,fa,fb,fc,tol,lev,maxlex);
fprintf('s1=%g \n',s1);
fprintf('n. val. funzioni=%d \n',itc);
plot(vet_val,zeros(size(vet_val)),'+r');
%%%
figure
plot(punti,yy,'b'); hold on
m=10;
[R,k,itf,vett_val]=romberg(f,a,b,tol,m);
fprintf('Metodo di Romberg\n');
