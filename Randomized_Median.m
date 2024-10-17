function [M, flag] = Randomized_Median(S)
    
    global count;
    n = length(S);
    flag = true;

    R = zeros(ceil(n^(3/4)),1);
    for i = 1:ceil(n^(3/4))
        idx = randi(n);
        R(i) = S(idx);
    end

    R = sort(R);
    count = count + length(R)*log(length(R));
    d = R(floor(0.5*n^(3/4)-sqrt(n)));
    u = R(ceil(0.5*n^(3/4)+sqrt(n)));
    
    C = []; Cd = []; Cu = [];
    for i = 1:n
        count = count + 2;
        if(S(i) >= d && S(i) <= u)
            C = [C; S(i)];
        elseif(S(i) < d)
            Cd = [Cd; S(i)];
        else
            Cu = [Cu; S(i)];
        end
    end

    ld = length(Cd);
    lu = length(Cu);
    
    count = count + 2;
    if(ld > n/2 || lu > n/2)
        M = -1;
        flag = false;
        return
    end
    
    count = count + 1;
    if(length(C) <= 4*n^(3/4))
        count = count + length(C)*log(length(C));
        C = sort(C);
    else
        M = -1;
        flag = false;
        return
    end

    idx = floor(n/2)-ld+1;
    M = C(idx);

end