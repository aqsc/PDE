function u = u_real(x,t)
%U_REAL 此处显示有关此函数的摘要
%   此处显示详细说明
if x -t < 0
    u = 1;
    
elseif ((x-t>= 0)&&(x-t<= 1))
    u = 1 - (x-t);
else
    u = (x-t) - 1;
end

