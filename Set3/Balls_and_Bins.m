function [X, empty_bins] = Balls_and_Bins(m,n)
    
    B = zeros(m,1);
    Y = zeros(m,n);
    X = zeros(1,n);

    for i = 1:m
        B(i) = randi(n,1);
    end

    for i = 1:m
        for j = 1:n
            if(B(i) == j)
                Y(i,j) = 1;
            end
        end
    end

    for j = 1:n
        for i = 1:m
            X(j) = X(j) + Y(i,j);
        end
    end
    
    empty_bins = 0;
    for j = 1:n
        if(X(j) == 0)
            empty_bins = empty_bins + 1;
        end
    end

