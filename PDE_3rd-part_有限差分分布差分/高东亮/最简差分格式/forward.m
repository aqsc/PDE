%% Forward difference
function u=forward(l,T,J,N,a)
h=l/J;
tau=T/N;
r=a*tau/h^2;                     %Íø±È
u=zeros(N+1,J+1);
x=0:h:l;
u(1,:)=funcphi(x);
f=tau*funcphi(x);
for n=1:N
    for j=2:J
        u(n+1,j)=r*u(n,j+1)+(1-2*r)*u(n,j)+r*u(n,j-1)+f(j);
    end
end
end      