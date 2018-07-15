%% Conjugate gradient methods
function [u,k]=CGM(a,b,c,d,h)
m=(b-a)/h;
v=zeros((m-1)^2,1);
u=zeros(m+1,m+1);
[A,f]=FPDM(a,b,c,d,h,h);
p=f-A*v;
r=zeros((m-1)^2,(m-1)^2);
r(:,1)=p;
k=1;
while k>0
    a=v;
    alpha=r(:,k)'*r(:,k)/(p'*A*p);
    v=v+alpha*p;
    r(:,k+1)=r(:,k)-alpha*A*p;
    beta=r(:,k+1)'*r(:,k+1)/(r(:,k)'*r(:,k));
    p=r(:,k+1)+beta*p;
    q=0;
    for i=1:(m-1)^2
        if abs(v(i)-a(i))>1e-4
            q=q+1;
        end
    end
    if (q==0 || k==(m-1)^2)
        break;
    end
    k=k+1;
end
for i=2:m
    u(i,2:m)=v((m-1)*(i-2)+1:(m-1)*(i-1));
end
end