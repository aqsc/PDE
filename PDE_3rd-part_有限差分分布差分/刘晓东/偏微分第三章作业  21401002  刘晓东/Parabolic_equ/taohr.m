function [ h, tao, r ] = taohr( l, T, J, N, a )
%% 计算步长 h, tao, 和网比 r

tao = T / N;
h = l / J;
r = a * tao ./ (h^2);

end