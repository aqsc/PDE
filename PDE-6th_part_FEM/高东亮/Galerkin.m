%% Galerkin   Linear element 
function u=Galerkin(a,b,h)
p=1;
q=pi^2/4;
n=(b-a)/h;
A=zeros(n,n);
F=zeros(n,1);
x=a:h:b;
fun1 = @(xi) -p/h+h*q*(1-xi).*xi;
fun2 = @(xi) p/h+h*q*(1-xi).^2;
fun3 = @(xi) p/h+h*q*xi.^2;
c=integral(fun1,0,1);
d=integral(fun2,0,1)+integral(fun3,0,1);
for i=2:n
    A(i-1,i)=c;
end
for i=1:n-1
    A(i+1,i)=c;
    A(i,i)=d;
end
A(n,n)=integral(fun3,0,1);
for i=1:n-1
    fun4 = @(xi) funcf(x(i)+h*xi).*xi;
    fun5 = @(xi) funcf(x(i+1)+h*xi).*(1-xi);
    F(i)=h*integral(fun4,0,1)+h*integral(fun5,0,1);
end
fun6 = @(xi) funcf(x(n)+h*xi).*xi;
F(n)=h*integral(fun6,0,1);
u=zeros(n+1,1);
u(2:n+1)=A\F;  
end    