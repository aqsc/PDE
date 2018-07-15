function [u,u_r,Num_SOR]= SOR(h)
%SOR Summary of this function goes here
%   Detailed explanation goes here
format long
global x y N
tic
u_ba = cos(pi*h);
w = 2/(1+(1-u_ba^2));
u = zeros(N+1);         %记录求解值
u_r = zeros(N+1);       %真实值
k =0;
Num_SOR = 0;
while k >=0
    k = 0;
    Num_SOR =  Num_SOR + 1;
    for i = 2:N
        for j = 2:N
            u_ij = u(i,j);
            u(i,j) = u(i,j) -w*(u(i,j) - 1/4*u(i-1,j) - 1/4*u(i,j-1) - 1/4*u(i+1,j) - 1/4*u(i,j+1)) + w*h^2/4*f(x(i),y(j));
            if abs(u(i,j)-u_ij) > 10^(-4)
                k = k +1;   
            end
            u_r(i,j) = exp(pi*(x(i)+y(j)))*sin(pi*x(i))*sin(pi*y(j));
        end
    end
    if k ==0
        break;
    end
end       
t_SOR = toc;
disp('t_SOR operation time:');
disp(t_SOR);
end


