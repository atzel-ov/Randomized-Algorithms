function [A,B] = partition(G)
    
    V = G{1};
    A = [];
    B = [];

    for v = 1:length(V)
        if rand < 0.5
            A = [A; v];
        else
            B = [B; v];
        end
    end

