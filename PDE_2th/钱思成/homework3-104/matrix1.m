function A = matrix1(n)
A = zeros((n-1)^2,(n-1)^2);
a = zeros(n-1);
for i=1:(n-1)-1
 
        a(i,i)=4;
        a(i,i+1)=-1;
        a(i+1,i)=-1;
 
end
a((n-1),(n-1))=4;
s=a;
k=1;
while k<(n-1)
    a=blkdiag(a,s);
    k=k+1;
end
A=a;

for i=1:(n-1)*(n-2)
    A(i,n-1+i)=-1;
end


for i=1:(n-1)*(n-2)
    A(n-1+i,i)=-1;
end
A;