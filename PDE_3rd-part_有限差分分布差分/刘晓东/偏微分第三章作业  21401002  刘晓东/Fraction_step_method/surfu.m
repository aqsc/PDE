function surfu( h, t, method )
%% �����������ά�ȴ�������

% �ɲ����������
tao = 0.01;
N = t / tao;
M = 1 / h;
v = 1;

% ���� vΪ�ȴ��������Ҷ�ϵ��,fi Ϊ��ֵ
r = v * tao / h^2;
fi = zeros(M-1,M-1);

% ���񻯶�����
x = 0:h:1;
y = 0:h:1;
[yy,xx] = meshgrid(y,x);

% ѡ�񷽷���ⷽ�̵ý� u
switch method
    case 'ADI'
        u = ADI( h, N, M, tao, r, fi );
    case 'PC'
        u = PC( h, N, M, tao, r, fi );
    case 'LOD'
        u = LOD( h, N, M, tao, r, fi );
end

% ��ͼ
surf(xx, yy, u);
xlabel('x')
ylabel('y')
zlabel('u')
title( [method ' method'])


end