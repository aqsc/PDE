%% Ritz   Linear element 
function u=Ritz(a,b,h)
p=1;q=pi^2/4;
n=(b-a)/h;
K=zeros(n,n);            %总刚度矩阵
M=zeros(n,n);
B=zeros(n,1);
x=a:h:b;
D=p*[1/h -1/h;-1/h 1/h];
C=q/3*[h h/2;h/2 h];
K(1,1)=p/h;M(1,1)=q*h/3;
for i=1:n-1
    Ki=zeros(n,n);                %单元刚度矩阵
    Ki(i:i+1,i:i+1)=D;
    Mi=zeros(n,n);                %单元质量矩阵
    Mi(i:i+1,i:i+1)=C;
    K=K+Ki;
    M=M+Mi;
end
A=K+M;
for i=1:n-1
    fun4 = @(xi) funcf(x(i+1)+h*xi).*(1-xi);          %f(i,i+1)
    fun5 = @(xi) funcf(x(i)+h*xi).*xi;                %f(i,i)
    B(i)=h*integral(fun4,0,1)+h*integral(fun5,0,1);
end
fun6 = @(xi) funcf(x(n)+h*xi).*xi;                    %f(n,n)
B(n)=h*integral(fun6,0,1);
u=zeros(n+1,1);
u(2:n+1)=A\B; 
end
