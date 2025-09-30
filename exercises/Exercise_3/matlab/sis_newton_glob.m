function [x,it,iterati,merito] = sis_newton_glob(fvett,jac,x0,tolx,tolf,maxit)
%Parametri per cui dipende il metodo
beta=1e-4; %va cosi' di default sempre di solito
rho=0.5;
delta=0.01;
%%%%%
x=x0(:);
n=length(x);
iterati{1}=x;
f=feval(fvett,x);
J=feval(jac,x);
merito=zeros(maxit,1);
merito(1)=0.5*norm(f)^2;
for it=1:maxit
    dx=J\(-f); %J dx=-f
    gradmerito=J'*f;
    tau=1;
    dirdis=gradmerito'*dx;
    costheta=abs(dirdis)/(norm(gradmerito)*norm(dx));
    while costheta <= delta
        [Q,R]=qr([J; sqrt(tau)*eye(n)]);
        R=R(1:n,:);
        dx=R\(R'\(-gradmerito));
        dirdis=gradmerito'*dx;
        tau=tau*10;
    end
    %Ok e' come se stessimo partendo come se alpha fosse uguale a 1
    f0=f;
    x0=x;
    alpha=1;
    normf0=norm(f0)^2;
    x=x0+alpha*dx;
    f=feval(fvett,x);
    while norm(f)^2>(1-2*beta*alpha)*normf0
        alpha=alpha*rho;
        x=x0+alpha*dx;
        f=feval(fvett,x);
    end
    iterati{it+1}=x;
    merito(it+1)=1/2*norm(f)^2;
    if (norm(dx,inf)<=eps+tolx*norm(x,inf)) && (norm(f,inf)<=tolf)
        break
    end 
    J=feval(jac,x);
end
if it>=maxit
    fprintf('raggiunto massimo numero di iterazioni\n');
end