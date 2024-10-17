function S_sorted = Quick_Sort(S)
    
    global count;
    n = length(S);
    if(n == 0 || n == 1)
        S_sorted = S;
        return
    end

    idx = randi(n);
    x = S(idx);
    
    S1 = [];
    S2 = [];
    for i = 1:n
        if(S(i) < x)
            count = count + 1;
            S1 = [S1; S(i)];
        end
        if(S(i) > x)
            count = count + 1;
            S2 = [S2; S(i)];
        end
    end
    
    S1 = Quick_Sort(S1);
    S2 = Quick_Sort(S2);

    S_sorted = [S1; x; S2];

end