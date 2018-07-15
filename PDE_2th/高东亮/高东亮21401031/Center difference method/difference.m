%%The second order ordinary differential equation boundary value:
function u=difference(a,b,c,d,h)
n=(b-a)/h;
u=zeros(n+1,1);
u(1)=c;
u(n+1)=d;
A=zeros(n-1,n-1);            %Coefficient matrix
W=zeros(n-1,1);              %W=(f(x(i)))
for i=1:n-1
    A(i,i)=2/(h^2)+q(a+h*i);
    W(i)=f(a+h*i);
end
W(1)=W(1)+c/(h^2);
W(n-1)=W(n-1)+d/(h^2);
for i=1:n-2
    A(i,i+1)=-1/(h^2);
    A(i+1,i)=-1/(h^2);
end
u(2:n)=A\W;