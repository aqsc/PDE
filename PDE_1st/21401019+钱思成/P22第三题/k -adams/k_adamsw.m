%%
function u = k_adamsw(k)
%% adams外插法求解
global h n
u = zeros(1,n+1);
u(1) = 1;
%f = zeros(1,n+1);
%% 求前k个初值 用单步法求初值
for i =1:k           
%    f(i) = -5 * u(i);
    u(i+1) = u(i) + h*(-5*u(i));

end

for i = k+1:n
    si = 0;
    for l = 0:k
%         f(i-l) = -5*u(i-1);
%         si = si + b_kl(k,l)*f(i-l);    
          si = si + b_kl(k,l)*(-5)*u(i-1);

    end
    u(i+1) = u(i) + h*si;
    
end



   


