xspan=[0,1];%x的区间
tspan=[0,0.1];%t的区间
fun=inline('0*x'); %f(x)
fun1=inline('sin(pi*x)');%U(x,0)的表达式
N=100;
J=10;
a=1;

[u,F,S,I,r,x,T]=initial(a,N,J,xspan,tspan,fun,fun1); %初始化值
r     %网比

%%%%%%%%%% 选择差分方式 %%%%%%%%%%%%%%%%%%%%%%

U=diff_front(u,F,I,S,r,T,N,J);%向前差分
%U=diff_back(u,F,I,S,r,T,N,J);%向后差分
%U=sixpiont_symmetry(u,F,I,S,r,T,N,J); %六点对称
%U=Richardson(u,F,I,S,r,T,N,J); %理查德森法


%%%%%%%%% 画图 %%%%%%%%%%%%%%%
y=exp(-(pi^2)*0.1)*sin(pi*x);%t=0.1时U的曲线

plot(x,y,'r-',x,U(:,N+1),'g--')
legend('精确解','拟合值')

 

