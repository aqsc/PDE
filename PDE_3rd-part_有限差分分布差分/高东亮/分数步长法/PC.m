%% Predictor-corrector method
function u=PC(l,h,tau,T)
M=l/h;
m=T/tau;
u=zeros(M+1,M+1);
v=zeros(M+1,M+1);
%系数矩阵
delta=zeros(M+1,M+1);
for i=1:M
    delta(i,i+1)=1;
    delta(i+1,i)=1;
    delta(i,i)=-2;
end
delta(M+1,M+1)=-2;
A=eye(M+1)-tau/(2*h^2)*delta;
%右端非齐次项
F=zeros(M+1,M+1,m); 
x=0:h:l;
y=0:h:l;
t=0:tau:T;
for k=1:m
    for i=2:M
        for j=2:M           
            F(i,j,k)=tau*funcf(x(i),y(j),t(k)+tau/2);
        end
    end
end

for k=1:m
    a=u;         %表示u(n)
    for j=2:M
        u(:,j)=A\(u(:,j)+F(:,j,k)/2);   %求u(n+1/4)
    end
    for i=2:M 
        u(i,:)=u(i,:)/A;                %求u(n+1/2)
    end
    for i=2:M
        for j=2:M
            v(i,j)=tau/h^2*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1)-4*u(i,j))+a(i,j)+F(i,j,k);     %求u(n+1)
        end
    end
    u=v;
end
u=u';
