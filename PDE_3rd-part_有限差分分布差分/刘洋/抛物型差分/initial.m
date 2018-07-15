function  [u,F,S,I,r,x,T]=initial(a,N,J,xspan,tspan,fun,fun1)

%a 表示二阶导前的系数,r表示比率
%N,J分别表示x,t的节点数
%xspan,tspan,指想x,t的区间
%fun表示f(x)
%fun1表示u(x,0)
%u表示网格点值，F=[f(1),....,f(J-1)]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% 初始化 u, F %%%%%%%%%%%%
u=zeros(J+1,N+1);
F=zeros(J+1,1);

h=(xspan(2)-xspan(1))/J;
T=(tspan(2)-tspan(1))/N;
r=a*T/(h*h);  %网比

%下面求F以及U(:,1)
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    F(i)=feval(fun,x(i));
    u(i,1)=feval(fun1,x(i));
end

%%%初始化S 、 I %%%%%%%%
I=eye(J-1);
S=zeros(J-1,J-1);

 for i=1:J-2
  S(i,i+1)=1;
  S(i+1,i)=1;
 end
 
 




