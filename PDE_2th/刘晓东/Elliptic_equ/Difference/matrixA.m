function A = matrixA( N,h )
%% 利用差分方程计算系数矩阵A, 为三对角矩阵
A = zeros(N-1,1);
for i = 1:N-1
    for j = 1:N-1
        if j == i
            A(i,j) = 2 / h^2 + q(i*h);
        elseif abs(j - i) == 1
                A(i,j) = -1 / h^2;
        else
            A(i,j) = 0;
        end
    end
end
end

