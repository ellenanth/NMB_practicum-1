function [L,R] = Householder_explicit(A)
[m,n] = size(A);
R = A;
L = zeros(m,n);
for k = 1:n
    v=zeros(m,1);
    v(k:m)=R(k:m,k);
    v(k)=v(k)+norm(v);
    v = v./norm(v,2);
    L(1:m,k) = v;
    R(k:m,k:n) = R(k:m,k:n) - 2*v(k:m)*(v(k:m)'*R(k:m,k:n));
end
end
