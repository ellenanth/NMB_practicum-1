function [x, itx, res, dx] = NMB_gmres(A,b,maxit)

Q(:,1) = b/norm(b);
itx = zeros(maxit,maxit);
res = zeros(1,maxit);
dx = zeros(1,maxit);
x_exact = A\b;
m = size(A,1);

for n=1:maxit
  v = A*Q(:,n);
  for j = 1:n
    H(j,n) = Q(:,j)'*v;
    v = v - H(j,n)*Q(:,j);
  end  
  
  [Q_H, R_H] = qr(H);
  e1 = zeros(n,1);
  e1(1,1) = norm(b);
  y = R_H\e1;
  
  x_n = Q*y;
  itx(1:m,n) = x_n;
  
  res(1,n) = norm(A*x_n-b);
  dx(1,n) = norm(x_n-x_exact);
  
  H(n+1,n) = norm(v);  
  if H(n+1,n) <= 0 
      break;
  end
  Q(:,n+1) = v/H(n+1,n);
  
end
x=itx(:,maxit);
end