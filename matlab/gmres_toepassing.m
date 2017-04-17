m=100;
alpha=10;
maxit = 10;

A = sprand(m,m,0.5);
A = A + alpha*speye(m);
A=A/norm(A,1);
b=rand(m,1);

[x, itx, res, dx] = NMB_gmres(A,b,maxit);
X = 1:maxit;
plot(X,res,'b.-');