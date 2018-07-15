%% Peaceman-Rachford iteration method (multiple parameters)
function [u,k]=PR2(a,b,h,p)
m=(b-a)/h;
v=zeros((m-1)^2,1);
u=zeros(m+1,m+1);
x=a:h:b;
y=a:h:b;
a=sin(pi*h/2)^2;
rho=2^(1/2)-1;
tau=zeros(p,1);
for i=1:p    
    tau(i)=h^2/(4*a)*((1-rho)/(1+rho))^(2*p-1);
end
l1=zeros(m-1,m-1);
l2=zeros(m-1,m-1);
for i=1:m-1
    l1(i,i)=2/h^2;
    l2(i,i)=2/h^2;
end
for i=2:m-1
    l1(i-1,i)=-1/h^2;
    l2(i,i-1)=-1/h^2;
end
for i=1:m-2
    l1(i+1,i)=-1/h^2;
    l2(i,i+1)=-1/h^2;
end
L1=kron(eye(m-1),l1);
L2=kron(l2,eye(m-1));
F=zeros((m-1)^2,1);
for j=1:m-1
    for i=1:m-1
        F((m-1)*(j-1)+i)=funcf(x(i+1),y(j+1));
    end
end
k=1;
I=eye((m-1)^2);

while k>0 
    a=v;
    b=mod(k-1,p)+1;
    A=I+tau(b)*L1;
    B=(I-tau(b)*L2)*v+tau(b)*F;
    v=A\B;
    C=I+tau(b)*L2;
    D=(I-tau(b)*L1)*v+tau(b)*F;
    v=C\D;
    s=0;
    for i=1:(m-1)^2
        if abs(v(i)-a(i))>1e-4
            s=s+1;
        end
    end
    if s==0
        break;
    end
    k=k+1;
end
for i=2:m
    u(i,2:m)=v((m-1)*(i-2)+1:(m-1)*(i-1));
end
end