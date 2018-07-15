%% Jacobi iteration
function [u,k]=Jacobi(a,b,c,d,h)
m=(b-a)/h;
n=(d-c)/h;
t=(m+1)*(n+1);
z=zeros(m+1,n+1,t);
x=a:h:b;
y=c:h:d;
f=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        f(i,j)=h^2*funcf(x(i+1),y(j+1))/4;
    end
end
k=1;
while k>0 
    s=0;
    for i=2:m
        for j=2:n
            z(i,j,k+1)=(z(i-1,j,k)+z(i,j-1,k)+z(i+1,j,k)+z(i,j+1,k))/4+f(i-1,j-1);
            if abs(z(i,j,k+1)-z(i,j,k))>1e-4
                s=s+1;
            end
        end
    end
    if s==0
        break;
    end
    k=k+1;
end
u=z(:,:,k);
end
