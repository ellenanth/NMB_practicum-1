function E = bisection(A,a,b,tol)
queue = [a,b];
E = [];
while size(queue,1)~=0
    l = queue(1,1);
    r = queue(1,2);
    queue = queue(2:end,:);
    [~,s_l] = sturm(A,l);
    [~,s_r] = sturm(A,r);
    nb_ev = s_r - s_l;
    mid=(r-l)/2;
    if nb_ev == 1
        if mid < tol
            E = [E;l+mid];
        else
            queue = [l l+mid;l+mid r;queue];
        end
    elseif nb_ev > 1
        queue = [l l+mid;l+mid r;queue];
    end
end
end