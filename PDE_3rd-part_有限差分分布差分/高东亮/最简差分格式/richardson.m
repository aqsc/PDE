%% Richardson difference
function u=richardson(l,T,J,N,a)
h=l/J;
tau=T/N;
r=a*tau/h^2;
u=zeros(N+1,J+1);
x=0:h:l;
u(1,:)=funcphi(x);
f=2*tau*funcphi(x);
for j=2:J
    u(2,j)=r*u(1,j+1)+(1-2*r)*u(1,j)+r*u(1,j-1)+f(j);
end
for n=2:N
    for j=2:J
        u(n+1,j)=2*r*(u(n,j+1)+2*u(n,j)+u(n,j-1))+u(n-1,j)+f(j);
    end
end
end      