function [ u ] = CGmethod( A,F,u )
%% The Conjugate-Gradient-method of the five-point difference equ

tic
p = F - A * u;
r = F - A * u;
iter = 1;

while 1
    v = u;
    s = r;
    q = p;
    alpha = (s' * s) / ((A*q)' * q);
    u = v + alpha * q;
    r = s - alpha * A * q;
    beita = (r' * r) / (s' * s);
    p = r + beita * q; 
    if(norm(v-u,2) < 1e-8)
        break;
    end
    iter = iter+1;
end
disp('Conjugate_Gradient_method')
disp(['iteration' num2str(iter)])
toc

end