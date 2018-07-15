
function [u_con,Num_CON] = congugate(h)

%PLOT Summary of this function goes here
%   Detailed explanation goes here
%--共轭梯度法求解偏微分方程
format long
global x y M N 
tic;
% a = 0;
% b = 1;
h1 = h;
h2 = h;
% [x,y] = meshgrid(0:h1:1);
% x = 0:h1:b;
% y = 0:h2:b;
% M = (b -a)/h1;
% N = (b -a)/h2;
%% ------------------------计算矩阵A---------------------------
A1 = zeros(M-1);
for i = 1:M-2
    A1(i,i) = 2/h1^2;
    A1(i,i+1) = -1/h1^2;
    A1(i+1,i) = -1/h1^2;
end
A1(M-1,M-1) = 2/h1^2;
A2 = zeros(N-1);
for i = 1:N-2
    A2(i,i) = 2/h2^2;
    A2(i,i+1) = -1/h2^2;
    A2(i+1,i) = -1/h2^2;
end
A2(N-1,N-1) = 2/h2^2;
% A1 = spdiags([2/h1^2,-1/h1^2,-1/h1^2],[0,-1,1],m-1);
% A2 = spdiags([2/h2^2,-1/h2^2,-1/h2^2],[0,-1,1],n-1);
A = kron(eye(N-1),A1) + kron(A2,eye(M-1));
% [a,b] = size(A)
u= zeros((M-1)*(N-1),1);

F = zeros((M-1)*(N-1),1);
for j = 2:N 
    for i = 2:M   
        F((j-2)*(N-1)+i-1) = f(x(i),y(j));
    end
end

p = F - A*u;
r = F - A*u;
k =0;
Num_CON = 0;

while k >= 0
    u0 = u;
    Num_CON = Num_CON + 1;
    alpha = r'*r/((A*p)'*p);
    u = u + alpha*p;
    r_ = r;
    r = r - alpha*A*p;
    beta = r'*r/(r_'*r_);
    p = r + beta*p;
    %% 判断收敛性 
    rr = u - u0;
    if (norm(rr)<=eps)||(k==N-1)
        break;
    end
%     for i = 1:(N-1)*(N-1)
%         if abs(u(i) - u0(i)) > 10^(-4)
%             k = k+1;
%         end
%     end
%     if k == 0
%         break;
%     end
end

u_con = zeros(M+1,N+1);
for j = 1:N-1
    for i = 1:M-1  
        u_con(i+1,j+1) = u((M-1)*(j-1)+i);        
    end
end  
% 画图
% mesh(x,y,u_con)

t_con = toc;
disp('t_con operation time:');
disp(t_con);
end

