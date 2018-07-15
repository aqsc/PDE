function plotu( t, a, h, tao, num )
%%����t��a, h, tao, num ��ⷽ�̣���ͼ
% num = 1 or 2 ѡ�����ڶ���ķ���

% ����ڶ���ķ���
temp1 = 'normal_diff';
temp2 = 'central_diff';

% ������ز��������Ը�ʽ��Ⲩ�����̣� numΪ�жϲ���
switch num
    case 1
        explicitu = explicit_scheme(a,t,h,tao,temp1);
    case 2
        explicitu = explicit_scheme(a,t,h,tao,temp2);
end

% ������ȷ��
x = 0:h:1;
exactu = exact_solution(x', t);

% ��ͼ
plot(x, exactu, 'go-', x, explicitu, 'r*-')
title([' t = ' num2str(t) ' tao = ' num2str(tao)])
legend('��ȷ��', '�Ը�ʽ')
end

