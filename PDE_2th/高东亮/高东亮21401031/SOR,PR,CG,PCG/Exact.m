%% Exact solution
function u=Exact(a,b,c,d,h)
x=a:h:b;
y=c:h:d;
m=(b-a)/h+1;
n=(d-c)/h+1;
u=zeros(m,n);
for i=1:m
    for j=1:n
        u(i,j)=exp(pi*(x(i)+y(j)))*sin(pi*x(i))*sin(pi*y(j));
    end
end
end