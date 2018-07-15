
function [u1,u2,u3,u4,u5]=f_exact(h)

xspan=[0,5];
tspan=[0,5];
J=5/h;
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    
end

for i=1:J+1
    if ((x(i)-1)<=0)  u1(i)=1;
    elseif ((x(i)-1)<=1) u1(i)=feval(inline('1-(x-1)'),x(i));
    else u1(i)=feval(inline('(x-1)-1'),x(i));
    end
end

for i=1:J+1
    if ((x(i)-2)<=0)  u2(i)=1;
    elseif ((x(i)-2)<=1) u2(i)=feval(inline('1-(x-2)'),x(i));
    else u2(i)=feval(inline('(x-2)-1'),x(i));
    end
end

for i=1:J+1
    if ((x(i)-3)<=0)  u3(i)=1;
    elseif ((x(i)-3)<=1) u3(i)=feval(inline('1-(x-3)'),x(i));
    else u3(i)=feval(inline('(x-3)-1'),x(i));
    end
end


for i=1:J+1
    if ((x(i)-4)<=0)  u4(i)=1;
    elseif ((x(i)-4)<=1) u4(i)=feval(inline('1-(x-4)'),x(i));
    else u4(i)=feval(inline('(x-4)-1'),x(i));
    end
end

for i=1:J+1
    if ((x(i)-5)<=0)  u5(i)=1;
    elseif ((x(i)-5)<=1) u5(i)=feval(inline('1-(x-5)'),x(i));
    else u5(i)=feval(inline('(x-5)-1'),x(i));
    end
end



