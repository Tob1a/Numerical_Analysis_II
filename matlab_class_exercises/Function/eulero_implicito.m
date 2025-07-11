function y=eulero_implicito(f,y0,x0,x1,h,p) %p=numero di passi che devo effettuare poiche' e' implicito non espilicito
y(1,:)=y0;
n=fix((x1-x0)/h+0.5);%+0.5 perche' ho un h troppo piccolo e ci aggiungo qualcosa
x=linspace(x0,x1,n+1);
for i=1:n
    k1=feval(f,x(i),y(i,:));
    pre=y(i,:)+h*k1;
    for k=1:p
        pre=y(i,:)+h*feval(f,x(i+1),pre);
    end
    y(i+1,:)=pre;
end

