clc
close all 
clear 

global count;

%% Coupon Collector Problem
n = 100;
K = 500;

S = zeros(K,1);
for k = 1:K
    D = Coupon_Collector(n);
    S(k) = sum(D);
end

exS = mean(S);
thS = n*H(n);
figure
subplot(2,1,1)
plot(S,'k')
hold on 
plot(thS*ones(K,1),'m',LineWidth=1.9)
plot(exS*ones(K,1),'g--',LineWidth=1.35)
xlabel('Experiment $k$','Interpreter','latex')
ylabel('Collected Coupons','Interpreter','latex')
legend('selections','theoretical mean','experimental mean','Interpreter','latex')
subplot(2,1,2)
histogram(S)
xlabel('Collected Coupons','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')


%% Quick Sort
n = 100;
K = 500;

C = zeros(K,1);
for k = 1:K
    S = randperm(10*n,n)';
    count = 0;
    S_sorted = Quick_Sort(S);
    C(k) = count;
end

exC = mean(C);
thC = 2*(n+1)*H(n) - 4*n;
figure
subplot(2,1,1)
plot(C,'k')
hold on 
plot(thC*ones(K,1),'m',LineWidth=1.9)
plot(exC*ones(K,1),'g--',LineWidth=1.35)
xlabel('Experiment $k$','Interpreter','latex')
ylabel('Comparisons','Interpreter','latex')
legend('selections','theoretical mean','experimental mean','Interpreter','latex')
subplot(2,1,2)
histogram(C)
xlabel('Comparisons','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')


%% Randomized Median
C = [];
for n = 200:200:10000
    S = randperm(10*n,n)';
    count = 0;
    [M, flag] = Randomized_Median(S);
    while(flag ~= true)
        count = 0;
        [M, flag] = Randomized_Median(S);
    end
    C = [ C; count];
end

figure
plot(200:200:10000,C,'k',LineWidth=1.2)
xlabel('Size $n$','Interpreter','latex')
ylabel('Comparisons','Interpreter','latex')