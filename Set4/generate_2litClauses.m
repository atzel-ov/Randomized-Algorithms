function lit_clauses = generate_2litClauses(K,s,clauses)
    
    lit_clauses = zeros(K,2);

    for k = 1:K
        w = randi([1,2]);
        idx = clauses(k,w);

        if(s(idx) == 0)
            lit_clauses(k,w) = 1;
        end
    end



    
    