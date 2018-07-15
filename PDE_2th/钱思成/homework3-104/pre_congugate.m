function [u_pre,Num_PRE] = pre_congugate(h)
fun = inline('2*pi^2*exp(pi*(x+y))*(sin(pi*x)*cos(pi*y)+cos(pi*x)*sin(pi*y))');
tic
a = 0;b =1;
h1 = h;
h2 = h;
M = (b -a)/h1;
x = a:h1:b;
N = (b -a)/h2;
y = a:h2:b;

f1 = zeros(N+1);
for i=1:N+1
    for j=1:N+1
        f1(i,j)=feval(fun,x(i),y(j))*h*h;
    end
end
A = matrix1(N);
B = matrix2(N);
F = f1(2:N,2:N);
F = reshape(F,(N-1)^2,1);
u = zeros((N-1)^2,1);

b = F;
r = b-A*u;
s=tran(B,r);
s=s';
p=r;
Num_PRE = 0;
k =0;
while (r'*r)>1e-8 && k<=1000
    Num_PRE = Num_PRE + 1;
    r1 = r;
    s1 = s;
    t = (r1'*s1)/(p'*(A*p));
    u = u + t*p;
    r = r - t*A*p;
    s = tran(B,r);
    s = s';
    beta = (r'*s)/(r1'*s1);
    p = s + beta*p;
end 
if k == 1000
    disp('outer');
end
u = reshape(u,M-1,N-1);
u = abs(u);
u_pre = zeros(M+1,N+1);
u_pre(2:M,2:N) = u;
mesh(x,y,u_pre)
t_pre = toc;
disp('pre_congugate time:')
disp(t_pre)