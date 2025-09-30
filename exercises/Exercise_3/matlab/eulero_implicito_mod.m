function [y_esp,y_impl]=eulero_implicito_mod(f,y0,x0,x1,h,p) %p=numero di passi in cui voglio effettuare il corrector (quanto preciso deve essere)

x=x0:h:x1; %numero di nodi
y = zeros(length(x), length(y0));
y_esp = zeros(length(x), length(y0));
y_impl = zeros(length(x), length(y0));
y(1,:)=y0;

for i=1:length(x)-1
    %predictor
    pre=y(i,:)+h*feval(f,x(i),y(i,:)); %eulero esplicito in cui do in pasto come precedente il corrector
    y_esp(i,:)=pre;
    %corrector
    for k=1:p
        pre=y(i,:)+h*feval(f,x(i+1),pre); %eulero implicito
    end
    y(i+1,:)=pre;
end
%ultimo valore per il predictor che non ho
i=length(x);
y_esp(i,:)=y(i,:)+h*feval(f,x(i),y(i,:)); 
   
y_impl=y;