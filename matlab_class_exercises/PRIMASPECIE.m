close all
clear all
clc

%caso 1 slide 2
f2=@(x)exp(x).*sin(x);
a=0.5;b=1;
[i,itf]=simpson(f2,a,b,10);
i=i+0.5^3/3-0.5;
fprintf("I caso: I=%g Ift=%d\n",i,itf);


%caso 2
fprintf("Metodo adattivo") %usando il metodo troviamo la discontinuita'
tol=1e-5;lev=0;maxlev=10;
[s1,itc,vet,val]=quad_ada('es1',0,1,0,0,0,0,tol,lev,maxlev);
fprintf('s1=%g itc=%d\n',s1,itc);
t=linspace(0,1);
plot(t,zeros(size(t)),'b',vet_val,zeros(size(vet_val)),'+');



