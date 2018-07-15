function F = matrixF( N,h,u0,uN )
%% ���ò�ַ��̼���f���ɵ�����F

F = zeros(N-1,1);
for i = 1:N-1
    if i == 1
        F(i) = funf(i*h) + 1 / h^2 * u0;
    elseif i == N-1
        F(i) = funf(i*h) + 1 / h^2 * uN;
    else
        F(i) = funf(i*h);
    end
end

end

