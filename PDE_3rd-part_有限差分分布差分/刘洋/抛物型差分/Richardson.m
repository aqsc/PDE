function  U=Richardson(u,F,I,S,r,T,N,J) %理查德森法

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  A=(1+2*r)*I-r*S;
C=inv(A);
A1=inv(A);
u(2:J,2)=C*u(2:J,1)+T*A1*F(2:J);  %%求u(:,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q=2*r*(S-2*I);
for i=3:N+1
    u(2:J,i)=Q*u(2:J,i-1)+u(2:J,i-2)+2*T*F(2:J);  
end
U=u;