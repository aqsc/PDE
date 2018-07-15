function U=diff_back(u,F,I,S,r,T,N,J)  %Ïòºó²î·Ö
 
A=(1+2*r)*I-r*S;
C=inv(A);
A1=inv(A);

for i=2:N+1
    u(2:J,i)=C*u(2:J,i-1)+T*A1*F(2:J);  
end
U=u;