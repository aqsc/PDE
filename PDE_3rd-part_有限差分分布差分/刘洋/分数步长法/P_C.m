function [u,F]=P_C(fun,h,T,xspan,tspan)

M=(xspan(2)-xspan(1))/h;%x,y轴步长节点数
N=(tspan(2)-tspan(1))/T;%时间轴步长节点数
u=zeros(M+1,M+1,N+1);%二维热传导方程的解，三个坐标依次表示为x,y,t轴
u_half=zeros(M+1,M+1,N+1);%二维热传导方程(t=n+1/2)的解，三个坐标依次表示为x,y,t轴
u_half_1=zeros(M+1,M+1,N+1);
u_half_2=zeros(M+1,M+1,N+1);
u_quar=zeros(M+1,M+1,N+1);%二维热传导方程(t=n+1/4)的解，三个坐标依次表示为x,y,t轴

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
    
    for k=2:M %k表示y轴节点
        b=u(2:M,k,n)+T/2*F(2:M,k,n);
        u_quar(2:M,k,n)=sanduijiao(A,b);
    end
    
    for j=2:M %j表示x轴节点
        b=u_quar(j,2:M,n)';
       s=sanduijiao(A,b);
         u_half(j,2:M,n+1)=s;
    end
    
    
    
   for k=2:M %k表示y轴节点
        
        u_half_1(2:M,k,n)=A*u_half(2:M,k,n);
   end 
   
   
    for j=2:M %j表示x轴节点
         u_half_2(j,2:M,n)=(A*u_half(j,2:M,n)')';
    end
    
    u_half=u_half_1+u_half_2;
    
    
    u(2:M,2:M,n+1)=u_half(2:M,2:M,n)+T*F(2:M,2:M,n)+u(2:M,2:M,n);
end
    


