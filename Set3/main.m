clear
close all
clc

%% Randomized & Deterministic Max-Cut Algorithms

n = 1000;
p = 0.1;
G = Random_Graph(n,p);

[C_rand, count] = Large_Cut(G);
[C_det, A, B] = Max_Cut(G);

fprintf("For some random graph G with m/2 = %d \n", length(G{3})/2)
fprintf("A Large Cut of the Randomized algorithm is C(A,B) = %d \n", C_rand)
fprintf("A Large Cut of the Deterministic algorithm is C(A,B) = %d \n", C_det)


%% Empty Bins Concentration

n = 100;
m = n;
K = 10^3;

S = zeros(K,1);
for k = 1:K
    [X, S(k)] = Balls_and_Bins(m,n);
end

theor_mean = n*(1 - 1/n)^m;
exp_mean = mean(S);
figure
plot(S,'k')
hold on
plot(theor_mean*ones(K,1),'m',LineWidth=1.5)
hold on
plot(exp_mean*ones(K,1),'g--',LineWidth=1.3)
xlabel('Experiment $k$','Interpreter','latex')
ylabel('Empty Bins','Interpreter','latex')
legend('Empty Bins','theoretical mean','experimental mean','Interpreter','latex')

n_min = 0;
n_max = n - 1;

figure 
histogram(S,'BinLimits',[n_min,n_max], 'FaceColor','k')
xlabel('Empty Bins','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')