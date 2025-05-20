function pos_sat_clause = check_2SAT(x, clauses, lit_clauses)
    
    pos_sat_clause = zeros(length(clauses),1);
    for k = 1:length(clauses)
        clause = clauses(k,:);

        i_1 = clause(1);
        i_2 = clause(2);

        l_1 = x(i_1);
        if(lit_clauses(k,1) == 1)
            l_1 = 1-l_1;
        end
        
        l_2 = x(i_2);
        if(lit_clauses(k,2) == 1)
            l_2 = 1-l_2;
        end

        if((l_1 || l_2) == 1)
            pos_sat_clause(k) = 1;
        end
    end
        
