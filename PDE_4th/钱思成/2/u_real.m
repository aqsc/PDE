function u = u_real(x,t)
%U_REAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if x -t < 0
    u = 1;
    
elseif ((x-t>= 0)&&(x-t<= 1))
    u = 1 - (x-t);
else
    u = (x-t) - 1;
end

