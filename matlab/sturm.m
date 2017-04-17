function [ p,s ] = sturm( A,x )
%Zoek de veelterm pi om eigenwaarden en aantal tekenwissels in Sturm-rij te vinden 
%   A = tridiagonale matrix
%   x = shift van de A matrix
%   p = pi_1 tot pi_n
%   s = aantal tekenwissels in Sturm-rij

n = size(A,1);
p = zeros(n,1);
s = 0; 

p(1) = A(1,1) - x; % initialize from p(-1) = 0 & p(0) = 1
if p(1) < 0
    s = 1; 
end
p(2) = (A(2,2)-x)*p(1) - abs(A(1,2))^2;
if p(2)*p(1) < 0
    s = s+1; 
end

for k = 3:n
    p(k) = (A(k,k) - x)*p(k-1) - abs(A(k-1,k))^2*p(k-2);
    if p(k)*p(k-1) < 0
        s = s+1;
    end
end