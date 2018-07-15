function [ A ] = coefficient_matA( a1, a2, a3, J )
%% 差分格式的系数矩阵： 三对角矩阵A

A = diag(a1*ones(J-1,1)) + diag(a2*ones(J-2,1),-1) + diag(a3*ones(J-2,1),1);

end