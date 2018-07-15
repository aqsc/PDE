function U=sixpiont_symmetry(u,F,I,S,r,T,N,J) %Áùµã¶Ô³Æ

A=(1+r)*I-0.5*r*S;
B=(1-r)*I+0.5*r*S;
C=inv(A)*B;
A1=inv(A);

for i=2:N+1
    u(2:J,i)=C*u(2:J,i-1)+T*A1*F(2:J);  
end
U=u;