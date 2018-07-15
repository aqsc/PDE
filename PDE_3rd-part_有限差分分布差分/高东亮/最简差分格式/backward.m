%% Backward difference
function u=backward(l,T,J,N,a)
h=l/J;
tau=T/N;
r=a*tau/h^2;
u=zeros(N+1,J+1);
x=0:h:l;
u(1,:)=funcphi(x);
f=tau*funcphi(x);
A=zeros(J-1,J-1);
for i=1:J-2
    A(i,i)=1+2*r;
    A(i,i+1)=-r;
    A(i+1,i)=-r;
end
A(J-1,J-1)=1+2*r;
for n=1:N
    F=u(n,2:J)+f(2:J);
    u(n+1,2:J)=A\F';
end
end