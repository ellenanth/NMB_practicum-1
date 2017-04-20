clear;
A = sprand(1000,1000,0.1);
b = rand([1000,1]);
maxit = 100;
k=100;
[H, Q, Ritz] = arnoldi(A, b, maxit);

E = eigs(A,k);
X = zeros(1,maxit);
for it=1:maxit
    n=Ritz(1,it);
    for i = 1:n
       X_size = size(X,2);
       X(1, X_size+1) = it;
       Y(1, X_size+1) = real(Ritz(i+1,it));
    end
end
X_E = zeros(1,k)+101;
Y_E = real(E');
plot(X,Y, 'b.',X_E,Y_E,'r.');
xlabel('aantal iteratiestappen n');
ylabel('eigenwaarde');