function ux = k_adams( k )
%% adams内插法求解
%K_ADAMS Summary of this function goes here
%   Detailed explanation goes here
global h n
ux = zeros(1,n+1);
ux(1) = 1;
f = zeros(1,n+1);

for i =1:k
    ux(i+1) = ux(i) + h*(-5*ux(i));
    f(i) = -5 * ux(i);
end
uux = zeros(1,n+1);
uux(1) = 1;
%%
for i = k+1:n
    si = 0;
    for l = 1:k+1
%         f(i-l) = -5*u(i-1);
%         si = si + b_kl(k,l)*f(i-l);    
          si = si + b_klx(k+1,l)*(-5)*ux(i-1+1);
    end
    
    %% 迭代初始近似  用单步法求初值
    sn = 0;
    for l = 0:k
        sn = sn + b_klx(k,l)*(-5)*ux(i-l);
    end
    ux(i+1) = ux(i) + h*sn; 
    %% 迭代法进行求解
    m = 0;
    while m <= 20        
        uux(i+1) = ux(i) + h*(si + b_klx(k+1,0)*(-5)*ux(i+1));
        if abs(uux(i+1)-ux(i+1)) < 0.1
            break;
        else
            m = m + 1;
            ux(i+1) = uux(i+1);
        end
    end
    ux(i+1) = uux(i+1);
   
end

end

