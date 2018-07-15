clc
clear
close all
l=1;
tau=0.01;
h=[0.1 0.05];
T=[0.1 0.2 0.4 0.8];
%ADI法
for i=1:2
    figure;
    x=0:h(i):l;
    y=0:h(i):l;
    for j=1:4
        u=ADI(l,h(i),tau,T(j));
        subplot(2,2,j);
        mesh(x,y,u);
        title(['ADI h=',num2str(h(i)),' t=',num2str(T(j))]);
    end
end
%预-校法
for i=1:2
    figure;
    x=0:h(i):l;
    y=0:h(i):l;
    for j=1:4
        u=PC(l,h(i),tau,T(j));
        subplot(2,2,j);
        mesh(x,y,u);
        title(['PC h=',num2str(h(i)),' t=',num2str(T(j))]);
    end
end
%LOD法
for i=1:2
    figure;
    x=0:h(i):l;
    y=0:h(i):l;
    for j=1:4
        u=LOD(l,h(i),tau,T(j));
        subplot(2,2,j);
        mesh(x,y,u);
        title(['LOD h=',num2str(h(i)),' t=',num2str(T(j))]);
    end
end
