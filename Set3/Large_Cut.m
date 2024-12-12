function [C, count] = Large_Cut(G)
    
    V = G{1}; E = G{3};
    n = length(V); m = length(E);
    count = 0;

    while(1)
        count = count + 1;
        [A,B] = partition(G);

        C = 0;
        for i = 1:length(E)
            %count = count + 1;
            e = E(i,:);
            if((ismember(e(1),A) && ismember(e(2),B)) || (ismember(e(1),B) && ismember(e(2),A)))
                C = C + 1;
            end
        end
        
        if(C > m/2 + 1)
            break;
        end
    end


