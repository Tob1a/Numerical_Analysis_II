function  [x,it,iterati]=sis_newton(fvett,jac,x0,tolx,tolf,maxit);
%  
x=x0(:);
iterati{1}=x;
f=feval(fvett,x);
J=feval(jac,x);
for it=1:maxit
    dx=J\(-f);   %J dx=-f
    x=x+dx;
    f=feval(fvett,x); % f
    iterati{it+1}=x;
    if (norm(dx,inf)<=eps+tolx*norm(x,inf)) & (norm(f,inf)<=tolf)
        break
    end
    J=feval(jac,x);
end
if it>=maxit
    fprintf('raggiunto massimo numero di iterazioni\n');
end