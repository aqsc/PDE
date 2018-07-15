function [ f ] = funf( h, M, t )
%% 二维热传导方程右端的连续函数 f
% 刨去边界点， 取用内点

f = zeros(M-1, M-1);
for k = 1:M-1
    for j = 1:M-1
        f(j,k) = sin(5 * pi * t) * sin(2 * pi * h * j) * sin(pi * h * k);
    end
end

end