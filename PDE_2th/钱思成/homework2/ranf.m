function x = ranf(len,n)

% ------ ������Ǿ��ȷָ�
% ------ ���ÿ���������
m= len/n;
x = m*rand(1,n);
s = len - (sum(x) - x(n));

count = 0;                %���ѭ������
% index = 0;
% r = 0;
while s - m > 1e-18 || s < 1e-18
  while s < 1e-18
    index = int16(rand*(n-1) + 1);
    t = x(index);          %ȡ��i���ֵ
    r = rand; 
    x(index) = t*r;        %�ӵ�i�����ó�t*(1-r)�ӵ�s��
    s = s + t*(1-r);
    count = count + 1;
  end
  while s - m > 1e-18
    index = int16(rand*(n-1) + 1);
    t = x(index);                %ȡ��i���ֵ
    r = rand;
    x(index) = t + (m-t)*r;      %���i���м�(m-t)*r
    s = s - (m - t)*r;   
    count = count + 1;
  end
end
x(n) = len - (sum(x) - x(n));      %���һ��ȷ��




