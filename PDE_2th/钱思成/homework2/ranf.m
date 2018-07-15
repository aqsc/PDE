function x = ranf(len,n)

% ------ 将区间非均匀分割
% ------ 输出每个间隔长度
m= len/n;
x = m*rand(1,n);
s = len - (sum(x) - x(n));

count = 0;                %输出循环次数
% index = 0;
% r = 0;
while s - m > 1e-18 || s < 1e-18
  while s < 1e-18
    index = int16(rand*(n-1) + 1);
    t = x(index);          %取第i项的值
    r = rand; 
    x(index) = t*r;        %从第i项中拿出t*(1-r)加到s里
    s = s + t*(1-r);
    count = count + 1;
  end
  while s - m > 1e-18
    index = int16(rand*(n-1) + 1);
    t = x(index);                %取第i项的值
    r = rand;
    x(index) = t + (m-t)*r;      %向第i项中加(m-t)*r
    s = s - (m - t)*r;   
    count = count + 1;
  end
end
x(n) = len - (sum(x) - x(n));      %最后一项确定




