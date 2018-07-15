function surfu( a, l, T, J, N, method )
%% 求解方程并作图

% 计算步长 h, tao, 和网比r
[h, tao, r] = taohr(l, T, J, N, a);

% 将x,t网格化
x = 0:h:l;
t = 0:tao:T;
[TT,XX] = meshgrid(t,x);
uu = exp(-pi^2 * TT) .* sin(pi * XX);

switch method
    case 'Forward difference'
        u = Forward_diff(J, N, h, tao, r);
    case 'Backward difference'
        u = Backward_diff(J, N, h, tao, r);
    case 'Crank Nicolson'
        u = Crank_Nicolson(J, N, h, tao, r);
    case 'Richardson'
        u = Richardson(l, J, N, a, h, tao, r);
end

figure,

subplot(2,2,1),
surf(XX, TT, u)
title('The Solution ')
subplot(2,2,2),
surf(XX,TT,uu)
title('The Exact Solution')
subplot(2,2,3),
surf(XX,TT,u-uu)
title('The Error')

text(2,0, method, 'FontSize', 18)


end

