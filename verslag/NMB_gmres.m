function [x, itx] = NMB_gmres(A,b,maxit)

% function [x, itx, res, dx] = NMB_gmres(A,b,maxit)
%
% GMRES algoritme om het stelsel Ax=b op te lossen
%
% invoer: 
% A     - matrix A uit Ax=b
% b     - vector b uit Ax=b
% maxit - maximum aantal iteratiestappen
%
% uitvoer:
% x     - oplossing van het stelsel Ax=b
% itx   - vector met x doorheen de iteraties

Q(:,1) = b/norm(b);
itx = zeros(maxit,maxit);
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
  y = R_H\(Q_H'*e1);
  
  itx(1:m,n) = Q*y;
  
  H(n+1,n) = norm(v);  
  if H(n+1,n) <= 0 
      break;
  end
  Q(:,n+1) = v/H(n+1,n);
  
end
x=itx(:,maxit);
end