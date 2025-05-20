clear 
close all
clc

%% Dimensinallity Reduction using PCA 

d = 10^4; m = 50;

X = randn(d,m)*10;

Dx = [];
for i = 1:m
    for j = i+1:m
        Dx = [Dx; norm(X(:,i)-X(:,j))];
    end
end

epsilon = 10^-1; delta = 10^-1; aQ = m*(m-1)/2;
n = ceil(6*log(2*aQ/delta)/(epsilon^2));

W = randn(n,d)*(1/sqrt(n));

Y = W*X;

lower_bound = sqrt(1-epsilon)*Dx;
upper_bound = sqrt(1+epsilon)*Dx;

Dy = [];
for i = 1:m
    for j = i+1:m
        Dy = [Dy; norm(Y(:,i)-Y(:,j))];
    end
end

figure
plot(lower_bound,'b',LineWidth=0.2)
hold on
plot(upper_bound,'r',LineWidth=0.2)
hold on
plot(Dy,'k')
legend('$\sqrt{1-\epsilon}\|x_i-x_j\|$','$\sqrt{1+\epsilon}\|x_i-x_j\|$','$\|y_i-y_j\|$','interpreter','latex')
axis tight

count = 0;
for i = 1:m*(m-1)/2
    if(lower_bound(i) <= Dy(i) && upper_bound(i) >= Dy(i))
        count = count + 1;
    end
end

empirical_prob = count/aQ;

%% Randomized 2-SAT Algorithm

[n, m, K, clauses, s, lit_clauses] = generate_clause('random');

flag = randomized_2SAT(n,n^-(3/4),clauses,lit_clauses);

if(flag == 1)
    fprintf("The clause is satisfiable\n");
else
    fprintf("The clause is NOT satisfiable\n");
end

