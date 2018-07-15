function [ u ] = preproCGmethod( A,F,u )
%% The Prepro-CGmethod of the five-points difference equation
% B is the positive definite matrix

tic
B = preconditioner(A);    % The preconditioner of A
A1 = B\A;
F1 = B\F;

p = F1 - A1 * u;
r = F1 - A1 * u;

iter = 1;

while 1 
    v = u;
    s = r;
    q = p;
    alpha = (s' * s) / ((A1*q)' * q);
    u = v + alpha * q;
    r = s - alpha * A1 * q;
    beita = (r' * r) / (s' * s);
    p = r + beita * q; 
    if(norm(v-u,2) < 1e-8)
        break;
    end
    iter = iter+1;
end
disp('Preprocessing_CGmethod')
disp(['iteration' num2str(iter)])
toc

end