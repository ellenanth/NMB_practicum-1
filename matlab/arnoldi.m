function [H, Q, Ritz] = arnoldi(A, b, maxit)

% function [H, Q] = arnoldi(A, b, maxit)
%
% Arnoldi iteratie
% 
% invoer:
% A     - ijle matrix
% b     - startvector
% maxit - aantal iteraties
%
% uitvoer:
% H     - Hessenberg matrix
% Q     - orthogonale matrix
% Ritz  - matrix containing ritz values and number of eigenvalues


Q(:,1) = b/norm(b);
m_A = size(A,1);
Ritz = zeros(m_A+1,maxit);
for n=1:maxit
  v = A*Q(:,n);
  for j = 1:n
    H(j,n) = Q(:,j)'*v;
    v = v - H(j,n)*Q(:,j);
  end
  
  E = eig(H);
  m = size(E,1);
  Ritz(2:m+1, n) = E;
  Ritz(1, n) = m;
  
  H(n+1,n) = norm(v);
  if H(n+1,n) <= 0 
      break;
  end
  Q(:,n+1) = v/H(n+1,n);
  
  
end;

