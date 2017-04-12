function [y] = Apply_Q(L,b)
[m,n] = size(L);
y = zeros(n,1);
y(1:m,1) = b(1:m,1);
for k = 1:n
    y(k:m) = y(k:m) - 2 * L(k:m,k) * ( L(k:m,k)' * y(k:m) );
end
end
