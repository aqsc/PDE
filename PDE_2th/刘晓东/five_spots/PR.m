function [ u ] = PR( F,u,h,k )
%% The PR-method of the five-points difference equation

tic
n = 1/h;
m = 1/k;
temp1 = diag(-1*ones(n-2,1),1) + diag(-1*ones(n-2,1),-1) + diag(2*ones(n-1,1));
Ax = temp1./h^2;
temp2 = diag(-1*ones(m-2,1),1) + diag(-1*ones(m-2,1),-1) + diag(2*ones(m-1,1));
Ay = temp2./k^2;
L1 = kron(eye(m-1,m-1),Ax);
L2 = kron(Ay,eye(n-1,n-1));

tao = 1/2 * h^2 /sin(pi*h);
I = eye(size(L1));
iter = 1;

while 1
    utemp = u;
    v = (I + tao*L1)\((I - tao*L2) * utemp + tao * F);
    u = (I + tao*L2)\((I - tao*L1) * v + tao * F);
    if max(max(u-utemp)) < 1e-4
        break;
    end
    iter = iter + 1;
    
end
disp('Peaceman_Rachford_method')
disp(['iteration',num2str(iter)])
toc

end
