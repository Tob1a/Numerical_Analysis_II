function [y]=es1(x)
y=zeros(size(x));
ij=find(x>=0 & x<0.5);
y(ij)=x(ij).^2-1;
ij=find(x>=0.5 & x <=1);
y(ij)=exp(x(ij).*sin(x(ij)));