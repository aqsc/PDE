function [ f ] = funf( h, M, t )
%% ��ά�ȴ��������Ҷ˵��������� f
% ��ȥ�߽�㣬 ȡ���ڵ�

f = zeros(M-1, M-1);
for k = 1:M-1
    for j = 1:M-1
        f(j,k) = sin(5 * pi * t) * sin(2 * pi * h * j) * sin(pi * h * k);
    end
end

end