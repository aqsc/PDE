%% Peaceman-Rachford iteration method
function [u,k]=PR1(a,b,h)
m=(b-a)/h;
v=zeros((m-1)^2,1);
u=zeros(m+1,m+1);
x=a:h:b;
y=a:h:b;
tau=1/2*h^2*(sin(pi*h))^(-1);
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
    A=I+tau*L1;
    B=(I-tau*L2)*v+tau*F;
    v=A\B;
    C=I+tau*L2;
    D=(I-tau*L1)*v+tau*F;
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