load('mat1.txt');
disp(mat1);
[e,res] = qr_shiftrayleigh(mat1);
n = size(res,2);
plot(1:n, res,'bo:');