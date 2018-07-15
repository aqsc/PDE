%% Five-point difference method 
function [A,F]=FPDM(a,b,c,d,h,k)
x=a:h:b;
y=c:k:d;
m=1/h;n=1/k;
Ax=zeros(m-1,m-1);
Ay=zeros(n-1,n-1);
for i=1:m-1
    Ax(i,i)=2/h^2;
end
for i=2:m-1
    Ax(i-1,i)=-1/h^2;
    Ax(i,i-1)=-1/h^2;
end
for i=1:n-1
    Ay(i,i)=2/k^2;
end
for i=2:n-1
    Ay(i-1,i)=-1/k^2;
    Ay(i,i-1)=-1/k^2;
end
A=kron(eye(n-1),Ax)+kron(Ay,eye(m-1));
F=zeros((m-1)*(n-1),1);
for j=1:n-1
    for i=1:m-1
        F((m-1)*(j-1)+i)=funcf(x(i+1),y(j+1));
    end
end
end