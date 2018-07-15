function x=sanduijiao(A,b)
n=length(A);
x=zeros(1,n);
u=zeros(1,n);
Q=zeros(1,n);
u(1)=A(1,2)/A(1,1);
Q(1)=b(1)/A(1,1);
for i=2:n-1
    u(i)=A(i,i+1)/(A(i,i)-u(i-1)*A(i,i-1));
end

for i=2:n
    Q(i)=(b(i)-Q(i-1)*A(i,i-1))/(A(i,i)-u(i-1)*A(i,i-1));
end

x(n)=Q(n);
for i=(n-1):-1:1
    x(i)=Q(i)-u(i)*x(i+1);
end
