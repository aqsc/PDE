function [ h, tao, r ] = taohr( l, T, J, N, a )
%% ���㲽�� h, tao, ������ r

tao = T / N;
h = l / J;
r = a * tao ./ (h^2);

end