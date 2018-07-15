function u = LOD(t_final,tau,h)                                                                                   
%LOD 此处显示有关此函数的摘要
%   此处显示详细说明
%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ 分数步长法解抛物型方程
r = tau/h^2;      %  网比
M = 1/h;        %  x轴份数，y轴份数
N = t_final/tau;   %  时间份数
x = 0:h:1;
y = 0:h:1;
%******************************************************************
%初始条件
a = -r/2*ones(1,M-2);
b = (1+r)*ones(1,M-1);
A = diag(b,0) + diag(a,-1) + diag(a,1);
aa = r/2*ones(1,M-2);
bb = (1-r)*ones(1,M-1);
B = diag(bb,0) + diag(aa,-1) + diag(aa,1);
u = zeros(M+1);

for n = 1:N
    for k = 2:M
        F = zeros(M-1,1);
        for j = 2:M
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
        end  
        u(2:M,k) = A\(B*u(2:M,k) + tau*F);
    end
    for j = 2:M
        for k = 2:M
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
        end
        g = u(j,2:M);
        g = g';
        u(j,2:M) = A\(B*g + tau*F);
    end               
end
u = u';


end




