A = sprand(1000,1000,0.01);
b = rand([1000,1]);
maxit = 100;
[H, Q, Ritz] = arnoldi(A, b, maxit);

E = eigs(A, 10);
for it=1:maxit
    n=Ritz(1,it);
    for i = 1:n
       X_size = size(X,2);
       X(1, X_size+1) = it;
       Y(1, X_size+1) = Ritz(i+1,it);
    end
end
X_E = zeros(1,10);
Y_E = E';
plot(X,Y, 'b.',X_E,Y_E,'r.');
%plot(X_E,Y_E,'r.');