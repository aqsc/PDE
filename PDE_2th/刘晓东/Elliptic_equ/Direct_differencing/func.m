function f = func(t)
%% ���׳�΢�ַ����Ҷ�f
% u Ϊ���׳�΢�ַ��̵Ľ�
% pΪ��a,b����һ����������
% r,q,fΪ(a,b)����������
u = oriu(t);
p = funp(t);
r = funr(t);
q = funq(t);

f = -diff(p * diff(u)) + r * diff(u) + q * u;

end

