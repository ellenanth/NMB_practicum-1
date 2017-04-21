function [Q,R] = Householder_explicit(A)
[m,n] = size(A);
R = A;
V = zeros(m,n);
for k = 1:n
    v=zeros(m,1);
    v(k:m)=R(k:m,k);
    v(k)=v(k)+norm(v);
    norm_v = norm(v,2);
    if norm_v ~= 0
        v = v./norm(v,2);
    end
    V(1:m,k) = v;
    R(k:m,k:n) = R(k:m,k:n) - 2*v(k:m)*(v(k:m)'*R(k:m,k:n));
end

I = eye(m,m);
Q = zeros(m,m);
for l = 1:m
    x = I(1:m,l);
    for j = n:-1:1
        x(j:m) = x(j:m)-2*V(j:m,j)*(V(j:m,j)' * x(j:m)); 
    end
    Q(:,l) = x;
end
end
