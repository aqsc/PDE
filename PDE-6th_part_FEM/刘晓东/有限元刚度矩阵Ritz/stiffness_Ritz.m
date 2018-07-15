function u = stiffness_Ritz(q)
%% stiffness_Ritz为求解两点边值问题的刚度矩阵的Ritz算法。
%  xi 为运算过程中变换用到的一个变量
%  K = sum(Ki) Ki为单元刚度矩阵，K为总刚度矩阵
%  M = sum(Mi) 
%  steph 为步长

%  初始化相关参数
%  xi为函数变量
syms xi;    
n = 10;
K = zeros(n+1,n+1);
M = zeros(n+1,n+1);
b = zeros(n+1,1);

%  固定步长为0.1,选取（0,1）间的节点
steph = 0.1 * ones(n,1);
x = 0:0.1:1;

%  Ki,Mi为通过积分算的的单元刚度矩阵
%  K,M 为有单元刚度矩阵形成的总刚度矩阵
for i = 1:n
    Ki = [1/steph(i),-1/steph(i);-1/steph(i),1/steph(i)];
    Mi = [1/3,1/6;1/6,1/3] .* steph(i) .* q;
    funf = func( x(i)+steph(i) * xi);
    bi = [int(funf *(1-xi),xi,0,1); int(funf * xi, xi, 0, 1)] .* steph(i);
    K(i:i+1,i:i+1) = K(i:i+1,i:i+1) + Ki;
    M(i:i+1,i:i+1) = M(i:i+1,i:i+1) + Mi;
    b(i:i+1,1) = b(i:i+1,1) + bi;
end
A = K+M;

%  由公式[A11,A12;A21,A22] * U - b = 0求解 newA 即为A22,
%  newA * U~ - newb = 0
newA = A(2:n+1,2:n+1);
newb = b(2:n+1);
u = newA\newb;
%  求解后加入边值u0
u = [0,u(1:n)'];
end