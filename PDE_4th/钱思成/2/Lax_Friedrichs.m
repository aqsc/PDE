function u = Lax_Friedrichs( a,tau,h )
%LAX_FRIEDRICHS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global x x_final T
N = T/tau;
M = x_final/h;
u = zeros(1,M+1);
r = tau/h;

for j = 1:M+1
    u(j) = abs(x(j)-1);
end
f = a*u;                 
u0 = zeros(1,M+1);
for i = 1:N
    u0(1) = 1;
    for j = 2:M
        u0(j) = 1/2*(u(j-1)+u(j+1)) - r/2*(f(j+1)-f(j-1));
    end
    u0(M+1) = 1/2*(u(M)+u(M+1)+h) - r/2*(f(M+1)+h-f(M-1));
    f = u0;
    u = u0;
    
end


end



