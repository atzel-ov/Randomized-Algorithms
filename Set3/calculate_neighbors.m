function N = calculate_neighbors(v,G)

    A = G{2}; n = G{4}; N = 0;

    for i = 1:n
        for j = i:n
            if(i == v || j == v)
                N = N + A(i,j);
            end
        end
    end
    