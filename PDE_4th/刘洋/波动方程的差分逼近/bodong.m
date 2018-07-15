function   [u,x]=bodong(a,h,T,xspan,tspan,fun1,fun2)%波动方程的差分求解

J=(xspan(2)-xspan(1))/h;%x轴节点数
N=(tspan(2)-tspan(1))/T;%t轴节点数
r=a*T/h;%网比
u=zeros(J+1,N+1);

%%%求节点x的值，u(x,0)=F1(x),u_t(x,0)=F2(x)处的值
F1=zeros(J+1,1);
F2=zeros(J+1,1);
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    F1(i)=feval(fun1,x(i));
    F2(i)=feval(fun2,x(i));
end


%%%%有初始条件可得
u(:,1)=F1;
%%%下面求u(:,2)的值
for j=2:J
    u(j,2)=(r^2/2)*(F1(j-1)+F1(j+1))+(1-r^2)*F1(j)+T*F2(j);
end

%%%%%%%%由上可知U的1,2层已求出，下面用三层差分格式求剩余层
for n=2:N
    for j=2:J
        u(j,n+1)=r^2*(u(j-1,n)+u(j+1,n))+2*(1-r^2)*u(j,n)-u(j,n-1);
    end
end
u;

