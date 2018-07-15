%% main.m is the main script for solving the five point difference equation
tic
clear
clc
% h is the step of xAxis
% k is the step of yAxis
h = 1 / 64;
k = 1 / 64;

% get the coefficient matrix A and the right function F
% give a initialization u
[A,F,u] = five_spot(h,k);

% solve the five-point difference equation through
% Conjugate-Gradient-Method
v1 = CGmethod(A,F,u);
u1 = reshapeu(v1,h,k);

% solve the five-point difference equation through
% Preprocessing-Conjugate-Gradient-Method

v2 = preproCGmethod(A,F,u);
u2 = reshapeu(v2,h,k);

% solve the five-point difference equation through
% Successive-Over-Relaxation-Method(SOR)
u3 = SOR(h,k);

% solve the five-point difference equation through
% Peaceman-Rachford-Method(PR)
v4 = PR(F,u,h,k);
u4 = reshapeu(v4,h,k);

% get the meshgrid of x and y
x = 0:h:1;
y = 0:k:1;
[xx,yy] = meshgrid(x,y);

% the exaction solution for each point
uu = exp(pi * (xx+ yy)) .* sin(pi * xx) .* sin(pi * yy);

% get the surface and the error with the CG-method
figure,
surf(xx,yy,u1);
title('CGmethod')
figure,
surf(xx,yy,abs(u1-uu));
title('error of CGmethod')

% get the surface and the error with the Prepro-CG-Method
figure,
surf(xx,yy,u2);
title('preproCGmethod')
figure,
surf(xx,yy,abs(u2-uu));
title('error of preproCGmethod')

% get the surface and the error with the SOR-method
figure,
surf(xx,yy,u3)
title('SOR')
figure,
surf(xx,yy,abs(u3-uu));
title('error of SOR')

% get the surface and the error with PR-method
figure,
surf(xx,yy,u4)
title('PR method')
figure,
surf(xx,yy,abs(u1-uu));
title('error of PR method')

% get the original surface
figure,
surf(xx,yy,uu);
title('original')

disp('total time')
toc