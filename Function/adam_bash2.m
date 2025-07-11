function y=adam_bash2(f,y0,x0,x1,h)
%metodo a 2 passi
y(1,:)=y0;
n=fix((x1-x0)/h+0.5);%+0.5 perche' ho un h troppo piccolo e ci aggiungo qualcosa
x=linspace(x0,x1,n+1);

k1=feval(f,x(1),y(1,:));
y(2,:)=y(1,:)+h/2*(k1+feval(f,x(2),y(1,:)+h*k1));   %qui praticamente sto facendo 1 passo
%la formula sopra e' eulero migliorato

for i=3:n
    k1=feval(f,x(i-1),y(i-1,:));
    y(i,:)=y(i-1,:)+h/2*(3*k2-k1);
    k1=k2;
end


