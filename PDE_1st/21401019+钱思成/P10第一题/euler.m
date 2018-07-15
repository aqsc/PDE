clear;clc;
%-------------------------------%%-----------------------------------------%
%-------------------------------%%-----------------------------------------%
% written by Ǯ˼��, NO:21401019
% ����Euler�͸Ľ�Euler���������u' = -5u, ��t=0ʱ��u = 1
%EULER Summary of this function goes here
%   Detailed explanation goes here
a = 0;
b = 1;
h =input('Euler��steps h = ��');
t = a:h:b;
n = (b - a)/h;
u = zeros(1,n+1);
u(1) = 1;

u1 = zeros(1,n+1);
u1(1) = 1;
uu1 = zeros(1,n+1);
uu1(1) = 1;

ue = zeros(1,1+n);
ue(1) = 1;
uue = zeros(1,n+1);
uue(1) = 1;
for i = 1:n
    %% ��ʽEuler�������������
    u(i+1) = u(i) + h*func(u(i));  
    
    %% ��ʽEuler�������������
    ue(i+1) = ue(i);
    j = 0;
    while j >=0
        uue(i+1) = ue(i) + h*(func(ue(i+1)));
        if abs(uue(i+1) - ue(i+1)) < 0.001  % ������������
            break;
        else
            j = j+1;
            ue(i+1) = uue(i+1);   % ��ue(i+1)�滻uue(i+1),���»ش���������ʽ�����
        end
        
    end    
    
    u1(i+1) = u1(i);     
    k = 0;
    %% ���õ���������Ľ�Euler��
    while k >=0 
        uu1(i+1) = u1(i) + (h/2)*(func(u1(i)) + func(u1(i+1))); 
        if abs(uu1(i+1) - u1(i+1)) < 0.001  % ������������
            break;
        else
            k = k+1;
            u1(i+1) = uu1(i+1);   % ��u1(i+1)�滻uu1(i+1),���»ش���������ʽ�����
        end
        
    end
    
end
u1 = uu1;
ue = uue;

uy = exp(-5*t);
plot(t,uy,'k-*')   %ԭ����ͼ��
hold on 
plot(t,u,'r-o')    %��ʽEuler��ͼ��
hold on
plot(t,ue,'g-o')   %��ʽEuler��ͼ��
hold on 
plot(t,u1,'y-o')   %�Ľ�Euler��ͼ��
legend('ԭ����ͼ��','��ʽEuler��ͼ��','��ʽEuler��ͼ��','�Ľ�Euler��ͼ��');
title('����ͼ��')
figure;

error = uy - u;
errore = uy - ue;
error1 = uy - u1;

plot(t,error,'r-o')     %��ʽEuler��ͼ�����
hold on 
plot(t,errore,'g-o')    %��ʽEuler��ͼ�����
hold on
plot(t,error1,'y-o')    %�Ľ�Euler��ͼ�����
title('������');
legend('��ʽEuler��������','��ʽEuler��ͼ�����','�Ľ�Euler��������');


