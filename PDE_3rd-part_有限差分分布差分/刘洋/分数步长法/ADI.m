function [u,F]=ADI(fun,h,T,xspan,tspan)

M=(xspan(2)-xspan(1))/h;%x,y轴步长节点数
N=(tspan(2)-tspan(1))/T;%时间轴步长节点数
u=zeros(M+1,M+1,N+1);%二维热传导方程的解，三个坐标依次表示为x,y,t轴
u_half=zeros(M+1,M+1,N+1);%二维热传导方程(t=n+1/2)的解，三个坐标依次表示为x,y,t轴
F=zeros(M+1,M+1,N+1);
for i=1:M+1
    x(i)=xspan(1)+(i-1)*h;
    y(i)=xspan(1)+(i-1)*h;
end

for i=1:N+1
    t(i)=tspan(1)+(i-1)*T;
end

for i=1:M+1
    for j=1:M+1
        for k=1:N+1
            F(i,j,k)=feval(fun,t(k),x(i),y(j));
        end
    end
end
F;




%%%%%%构造三对角阵%%%%%%%%%%
for i=1:M-2
    A(i,i)=1+T/(h*h);
    A(i,i+1)=-T/(2*h*h);
    A(i+1,i)=-T/(2*h*h);
end
A(M-1,M-1)=1+T/(h*h);


for n=1:N %n表示t轴节点
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
   % A*u_half(:,1,n)=(T/(2*h^2))*u(:,2,n)+(1-T/h^2)*u(:,1,n)+T/2*F(:,1,n);
  % b1=(T/(2*h^2))*u(:,2,n)+(1-T/h^2)*u(:,1,n)+T/2*F(:,1,n);
  % u_half(:,1,n)=sanduijiao(A,b1);
   % A*u_half(:,M+1,n)=(1-T/h^2)*u(:,M+1,n)+(T/(2*h^2))*u(:,M,n)+T/2*F(:,M+1,n);
   %b2=(1-T/h^2)*u(:,M+1,n)+(T/(2*h^2))*u(:,M,n)+T/2*F(:,M+1,n);
   %u_half(:,M+1,n)=sanduijiao(A,b2);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    for k=2:M %k表示y轴节点
        %A*u_half(:,k,n)=(T/(2*h^2))*u(:,k+1,n)+(1-T/h^2)*u(:,k,n)+(T/(2*h^2))*u(:,k-1,n)+T/2*F(:,k,n);
        
        b=(T/(2*h^2))*u(2:M,k+1,n)+(1-T/h^2)*u(2:M,k,n)+(T/(2*h^2))*u(2:M,k-1,n)+T/2*F(2:M,k,n);
        u_half(2:M,k,n)=sanduijiao(A,b);
    end
    
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    % A*u(1,:,n+1)'=(T/(2*h^2))*u_half(2,:,n)'+(1-T/h^2)*u_half(1,:,n)'+T/2*F(1,:,n)';
   % b1=(T/(2*h^2))*u_half(2,:,n)'+(1-T/h^2)*u_half(1,:,n)'+T/2*F(1,:,n)';
   % s1=sanduijiao(A,b1);
    %u(1,:,n+1)=s1;
    % A*u(M+1,:,n+1)'=(1-T/h^2)*u_half(M+1,:,n)'+(T/(2*h^2))*u_half(M,:,n)'+T/2*F(M+1,:,n)';
   % b2=(1-T/h^2)*u_half(M+1,:,n)'+(T/(2*h^2))*u_half(M,:,n)'+T/2*F(M+1,:,n)';
  % s2=sanduijiao(A,b2);
     %u(M+1,:,n+1)=s2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    for j=2:M %j表示x轴节点
        b=(T/(2*h^2))*u_half(j+1,2:M,n)'+(1-T/h^2)*u_half(j,2:M,n)'+(T/(2*h^2))*u_half(j-1,2:M,n)'+T/2*F(j,2:M,n)';
       s=sanduijiao(A,b);
         u(j,2:M,n+1)=s;
    end
    
end
    
    
    
    
    
    
    
    
    
    
    
