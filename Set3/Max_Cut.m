function [C, A, B] = Max_Cut(G)
    
    V = G{1}; E = G{3};

    A = [V(1)];
    B = [];

    A_neighbors = calculate_neighbors(V(1),G);
    B_neighbors = 0;

    for v = 2:length(V)

        N = calculate_neighbors(v,G);

        if A_neighbors <= B_neighbors
            A = [A; v];
            A_neighbors = A_neighbors + N;
        else
            B = [B; v];
            B_neighbors = B_neighbors + N;
        end

    end
    
    C = 0;
    for i = 1:length(E)
        e = E(i,:);
        if((ismember(e(1), A) && ismember(e(2), B)) || (ismember(e(1), B) && ismember(e(2), A)))
            C = C + 1;
        end
    end


