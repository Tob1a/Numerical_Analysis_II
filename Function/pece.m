function [x,y]=pece(f,y0,x0,x1,h,p)
%% Adam bashford di ordine 4 e Adam Moulton di ordine 5
%%%%%%%%%%%%%%%%%


y(1,:)=y0; %come primo elemento metto y0
n=fix((x1-x0)/h); %metto il fix perche' non sono sicuro sia un intero
x=linspace(x0,x1,n+1);
%%%%%%%%%%%%%%%
%tre passi di Runge-Kutta di ordine 4
for i=1:3
    k1=feval(f,x(i),y(i,:));
    k2=feval(f,x(i)+h/2,y(i,:)+h/2*k1);
    k3=feval(f,x(i)+h/2,y(i,:)+h/2*k2);
    k4=feval(f,x(i)+h,y(i,:)+h*k3);
    y(i+1,:)=y(i,:)+h/6*(k1+2*(k2+k3)+k4);
end

%qui prima di iniziare PECE dovrei riinizializzare le variabili k1,k2,k3
%non k4


%% PECE
for i=4:n
    %% predictor Adam bashford a 4 passi di ordine 4
    w=y(i,:)+h*(55*k4-59*k3+37*k2-9*k1)/24;
    %% corrector Adam moulton a 3 passi di ordine 4
    for k=1:p
        ff=feval(f,x(i+1),w);
        w=y(i,:)+h*(9*ff+19*k4-5*k3+k2)/24;
    end
    y(i+1,:)=w;
    %tutte le variabili sotto sono per non fare i conti
    k4=k3;
    k3=k2;
    k2=k1;
end
x=x';

%guardati il file. La prof ha sbagliato. Nonostante io aumento la
%complessita' con p=2 la mio accuratezza non cambia (il mio errore), quello
%su cui mi devo concentrare e' il passo(h)


