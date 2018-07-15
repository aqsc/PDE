%% Alternating direct implicit methon
function u=ADI(l,h,tau,T)
M=l/h;
m=T/tau;
v=zeros(M+1,M+1);
w=zeros(M+1,M+1);
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
x=0:h:l;
y=0:h:l;
t=0:tau:T;
%右端非齐次项
F=zeros(M-1,M-1,m);
for k=1:m
    for i=1:M-1
        for j=1:M-1
            F(i,j,k)=tau*funcf(x(i+1),y(j+1),t(k)+tau/2);
        end
    end
end

for i=1:m
    for k=2:M
        w(2:M,k)=A\(v(2:M,k-1:k+1)*B(1:3,2)+F(:,k-1,i)/2);  %求u(n+1/2)
    end
    for j=2:M
        v(j,2:M)=(B(2,1:3)*w(j-1:j+1,2:M)+F(j-1,:,i)/2)/A;  %求u(n+1)
    end
end
u=v';