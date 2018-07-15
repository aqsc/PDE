function B = matrix2(n)
B = zeros((n-1)^2,(n-1)^2);
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
B=a;