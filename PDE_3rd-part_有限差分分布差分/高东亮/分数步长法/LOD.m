%% Locally one dimensional method
function u=LOD(l,h,tau,T)
M=l/h;
m=T/tau;
v=zeros(M-1,M-1);
u=zeros(M+1,M+1);
%系数矩阵
delta=zeros(M-1,M-1);
for i=1:M-2
    delta(i,i+1)=1;
    delta(i+1,i)=1;
    delta(i,i)=-2;
end
delta(M-1,M-1)=-2;
A=eye(M-1)-tau/(2*h^2)*delta;
B=eye(M-1)+tau/(2*h^2)*delta;
%右端非齐次项
F=zeros(M-1,M-1,m);
x=0:h:l;
y=0:h:l;
t=0:tau:T;
for k=1:m
    for i=1:M-1
        for j=1:M-1
            F(i,j,k)=tau*funcf(x(i+1),y(j+1),t(k)+tau/2)/2;
        end
    end
end
for k=1:m
    for j=1:M-1
        v(:,j)=A\(B*v(:,j)+F(:,j,k));  %求u(n+1/2)
    end
    for i=1:M-1
        v(i,:)=(v(i,:)*B+F(i,:,k))/A;  %求u(n+1)
    end
end
v=v';
u(2:M,2:M)=v;