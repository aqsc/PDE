function plotu( t, a, h, tao, num )
%%给定t，a, h, tao, num 求解方程，作图
% num = 1 or 2 选择计算第二层的方法

% 计算第二层的方法
temp1 = 'normal_diff';
temp2 = 'central_diff';

% 带入相关参数利用显格式求解波动方程， num为判断参数
switch num
    case 1
        explicitu = explicit_scheme(a,t,h,tao,temp1);
    case 2
        explicitu = explicit_scheme(a,t,h,tao,temp2);
end

% 给出精确解
x = 0:h:1;
exactu = exact_solution(x', t);

% 作图
plot(x, exactu, 'go-', x, explicitu, 'r*-')
title([' t = ' num2str(t) ' tao = ' num2str(tao)])
legend('精确解', '显格式')
end

