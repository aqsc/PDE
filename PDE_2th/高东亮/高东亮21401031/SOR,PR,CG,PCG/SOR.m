%% SOR
function [u,k]=SOR(a,b,c,d,h)
m=(b-a)/h;
n=(d-c)/h;
u=zeros(m+1,n+1);
x=a:h:b;
y=c:h:d;
k=1;
mu=cos(pi*h);
omega=2/(1+sqrt(1-mu^2));
f=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        f(i,j)=omega*h^2*funcf(x(i+1),y(j+1))/4;
    end
end
while k>0 
    s=0;
    for i=2:m
        for j=2:n
            a=u(i,j);
            u(i,j)=(1-omega)*u(i,j)+omega*(u(i-1,j)+u(i,j-1)+u(i+1,j)+u(i,j+1))/4+f(i-1,j-1);
            if abs(u(i,j)-a)>1e-4
                s=s+1;
            end
        end
    end
    if s==0
        break;
    end
    k=k+1;
end
end