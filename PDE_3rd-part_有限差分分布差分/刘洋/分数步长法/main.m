 xspan=[0,1];
 tspan=[0,1];
 fun=inline('sin(5*pi*t)*sin(2*pi*x)*sin(pi*y)');%精确解表达式
 %%%%%%%%下面选择不同的h,T %%%%%%%%%%%
 h=0.1;T=0.01;
 % h=0.05;T=0.01;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 [u1,F1]=ADI(fun,h,T,xspan,tspan);
 [u2,F2]=LOD(fun,h,T,xspan,tspan);
[u3,F3]=P_C(fun,h,T,xspan,tspan);
t1=u1(:,:,0.1/T+1) %('ADI t=0.1')
t2=u2(:,:,0.1/T+1)%('LOD t=0.1') 
 t3=u3(:,:,0.1/T+1)%('P_C t=0.1')
  %%对于其他的t=0.2,0.4,0.8同样有上述可得，这里不再列出

  
  