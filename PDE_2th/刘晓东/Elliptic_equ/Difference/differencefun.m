function U = differencefun( N, h, u0, uN )
%% ���ù�ʽAU = F, ����U
A = matrixA(N, h);
F = matrixF(N, h, u0, uN);
U = A\F;

end

