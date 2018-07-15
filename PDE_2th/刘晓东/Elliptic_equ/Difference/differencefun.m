function U = differencefun( N, h, u0, uN )
%% 利用公式AU = F, 计算U
A = matrixA(N, h);
F = matrixF(N, h, u0, uN);
U = A\F;

end

