function flag = randomized_2SAT(n,m,clauses,lit_clauses)
    
    K = size(clauses,1);
    x = (sign(randn(n, 1)) + 1)/2;
    iters = 0;
    while(1)
        pos_sat_clause = check_2SAT(x, clauses, lit_clauses);
        if(sum(pos_sat_clause) == K)
            flag = 1;
            return;
        end

        unsat_clauses = find(pos_sat_clause == 0);
        uidx = unsat_clauses(randi(length(unsat_clauses)));
        clause = clauses(uidx,:);

        w = randi([1,2]);
        x(clause(w)) = 1 - x(clause(w));
        
        if(iters >= 2*m*n^2)
            flag = 0;
            return;
        end
        iters = iters + 1;
    end