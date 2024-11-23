clear
close all
clc

%% Maximum Load in Balls & Bins

k = 2;
n = 10^k;
K = 100;

L = (log(n))/(log(log(n)));
M = 3*(log(n))/(log(log(n)));


max_load = zeros(K,1);
for k = 1:K
    [B, Y, X, max_load(k)] = Balls_and_Bins(n,n);
end

figure 
plot(max_load,'ko',LineWidth=0.8)
hold on
plot(L*ones(K,1),'m--')
hold on
plot(M*ones(K,1),'m--')
legend('max load','lower bound','upper bound', 'interpreter', 'latex')
xlabel('Experiment $k$', 'interpreter', 'latex')
ylabel('Maximum Load', 'interpreter', 'latex')
axis([0 K 0.9*L 1.05*M])

figure
histogram(max_load)
xlabel('Maximum Load', 'interpreter', 'latex')
ylabel('Frequency', 'interpreter', 'latex')


%% Hamiltonian Cycles in Random Graphs
K = 50;
n = 500;
p = (1.0)*40*log(n)/n;
q = 1 - sqrt(1-p);


G = Random_Graph(n,p);
[P, FAIL, count1, count2] = Hamiltonian_Cycle(G);


verification_list = zeros(n,1);
for i = 1:length(P(1:end))-1
    verification_list(i) = G{2}(P(i),P(i+1));
end

if(sum(verification_list) == n)
    fprintf("The algorithm works !\n")
end