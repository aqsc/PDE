function [ A ] = coefficient_matA( a1, a2, a3, J )
%% ��ָ�ʽ��ϵ������ ���ԽǾ���A

A = diag(a1*ones(J-1,1)) + diag(a2*ones(J-2,1),-1) + diag(a3*ones(J-2,1),1);

end