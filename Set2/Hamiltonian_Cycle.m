function [P, FAIL, count1, count2] = Hamiltonian_Cycle(G)
    
    V = G{1}; A = G{2};
    n = G{4}; p = G{5};
    q = 1 - sqrt(1-p);
    path_exists = 1;
    
    used_edges = cell([n,1]);
    unused_edges = cell([n,1]);
    for v = 1:length(V)
        used_edges{v} = [];
        for u = v:length(V)
            if(A(u,v) == 1)
                w = rand;
                if(w <= q)
                    unused_edges{v} = [unused_edges{v}; u];
                else
                    unused_edges{u} = [unused_edges{u}; v];
                    unused_edges{v} = [unused_edges{v}; u];
                end                
            end
        end
        unused_edges{v} = unused_edges{v}(randperm(length(unused_edges{v})));
    end

    %% Path Search

    %% Step 1
    P = [];
    HEAD = V(randi(n),1);

    %% Step 2
    count1 = 0;
    while(1)
        count1 = count1 + 1;
        p_i = 1/n;
        p_ii = length(used_edges{HEAD})/n;
        w = rand;       %uar
        
        %% Perform Substep (i)
        if(w <= p_i)
            P = flip(P);
            HEAD = P(end);
        
        %% Perform Substep (ii)
        elseif(w <= p_i + p_ii)
            head_edges = used_edges{HEAD};
            v_i = head_edges(randi(length(head_edges),1));
            e = [HEAD v_i];

            if(v_i ~= P(end-1))
                P = rotate(P,e);
                HEAD = P(end);
            end

        %% Perform Substep (iii)
        else
            u = unused_edges{HEAD}(1);
            FIRST = [HEAD u];
            unused_edges{HEAD}(unused_edges{HEAD} == u) = [];
            used_edges{HEAD} = [used_edges{HEAD}; u];

            if(isempty(unused_edges{HEAD}) == true)
                fprintf("Hamiltonian Path NOT found\n");
                P = -1;
                FAIL = 1;
                break
            end

            if(~ismember(u,P))
                P = [P; u];
                HEAD = u;
            else
                P = rotate(P,FIRST);
                HEAD = P(end);
            end

        end
        
        %% Step 3
        if(count1 > 2*n*log(n))
            fprintf("Path Search Maximum iterations reached - %d.\n", count1)
            P = -1;
            FAIL = 1;
            break
        end
        if(check(P,G,'path') == 1)
            fprintf("Path found in %d iterations\n", count1);
            FAIL = 0;
            break
        end
        
    end

    %% Cycle Search

    %% Step 2
    count2 = 0;
    while(path_exists)
        count2 = count2 + 1;
        p_i = 1/n;
        p_ii = length(used_edges{HEAD})/n;
        w = rand;       %uar
        
        %% Perform Substep (i)
        if(w <= p_i)
            P = flip(P);
            HEAD = P(end);
        
        %% Perform Substep (ii)
        elseif(w <= p_i + p_ii)
            head_edges = used_edges{HEAD};
            v_i = head_edges(randi(length(head_edges),1));
            e = [HEAD v_i];
                
            if(v_i ~= P(end-1))
                P = rotate(P,e);
                HEAD = P(end);
            end

        %% Perform Substep (iii)
        else
            u = unused_edges{HEAD}(1);
            FIRST = [HEAD u];
            unused_edges{HEAD}(unused_edges{HEAD} == u) = [];
            used_edges{HEAD} = [unused_edges{HEAD}; u];

            if(isempty(unused_edges{HEAD}) == true)
                fprintf("Hamiltonian Cycle NOT found\n");
                P = -1;
                FAIL = 1;
                break
            end

            if(~ismember(u,P))
                P = [P; u];
                HEAD = u;
            elseif(check([P; u],G,'cycle') == 1 && ismember(u,P))
                fprintf("Cycle found in %d iterations\n", count2);
                P = [P; u];
                FAIL = 0;
                break
            else
                P = rotate(P,FIRST);
                HEAD = P(end);
            end

        end
        
        %% Step 3
        
        if(count2 > n*log(n))
            fprintf("Cycle Search Maximum iterations reached - %d.\n", count2)
            P = -1;
            FAIL = 1;
            break
        end
    end