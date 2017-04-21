clear;
maxit = 100;
load('mat1.txt');
[m,n] = size(mat1);

[e,res] = qr_shiftrayleigh(mat1);
k = size(res,2);
X_1 = 1:k;
Y_1 = res;
%plot(X_1,Y_1,'bo:');

[V,D] = gelijktijdige_it(mat1,eye(n,m),maxit);
disp(diag(D));
