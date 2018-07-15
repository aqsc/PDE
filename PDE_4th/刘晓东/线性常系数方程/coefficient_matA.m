function A = coefficient_matA( a1, a2, a3, J, k )
%% 差分格式的系数矩阵： A

A = zeros(J, J+k);
for i = 1:J
    for j = 1:J+k
        if j == i
            A(i,j) = a1;
        elseif j == i + 1
            A(i,j) = a2;
        elseif j == i + 2
            A(i,j) = a3;
        end
    end
end

end