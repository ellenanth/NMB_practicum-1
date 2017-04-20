m=100;
alpha=100;
maxit = 20;

A = sprand(m,m,0.5);
A = A + alpha*speye(m);
A=A/norm(A,1);
b=rand(m,1);

[x, itx] = NMB_gmres(A,b,maxit);
x_exact = A\b;
res = zeros(1,maxit);
dx = zeros(1,maxit);
for n=1:maxit
    res(1,n) = norm(A*itx(:,n)-b);
    dx(1,n) = norm(itx(:,n)-x_exact);
end

X = 1:maxit;
plot(X,res,'b.-',X,dx,'r*-');
xlabel('iteraties n');
legend('norm van residu', 'absolute fout');
title('alpha = 100');