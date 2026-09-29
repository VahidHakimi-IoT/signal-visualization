clear;
close all;
clc;

% Use the same random noise each time
rng(1);

%% Create a clean discrete-time signal

n = 0:100;
clean = sin(0.1*pi*n);

%% Add noise

noise = 0.4*randn(size(n));
measured = clean + noise;

%% Display the clean and noisy signals

figure;

plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.6 0.6 0.6]);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Clean and Noisy Signals');
legend('Clean Signal','Noisy Signal');%% Task 1: Amplitude Scaling

scaled = 2 * measured;

figure;

plot(n,measured,'Color',[0.6 0.6 0.6]);
hold on;
plot(n,scaled,'r','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Amplitude Scaling');
legend('Noisy Signal','Scaled Signal');

saveas(gcf,'signal_operations.png');
%% Task 2: Signal Delay

delay = 5;

delayed = [zeros(1,delay), measured];

n_measured = 0:length(measured)-1;
n_delayed = 0:length(delayed)-1;

figure;

plot(n_measured,measured,'Color',[0.6 0.6 0.6]);
hold on;
plot(n_delayed,delayed,'r','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Signal Delay by 5 Samples');
legend('Original Noisy Signal','Delayed Signal');
%% Task 3: Five-Point Moving-Average Filter

h5 = ones(1,5)/5;

filtered5 = conv(measured,h5,'same');

figure;

plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.6 0.6 0.6]);
plot(n,filtered5,'r','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Five-Point Moving-Average Filtering');
legend('Clean Signal','Noisy Signal','5-Point Filtered Signal');

saveas(gcf,'noise_filtering.png');
%% Task 4: Compare 5-Point and 15-Point Filters

h15 = ones(1,15)/15;

filtered15 = conv(measured,h15,'same');

figure;

plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.6 0.6 0.6]);
plot(n,filtered5,'r','LineWidth',1.5);
plot(n,filtered15,'k--','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Comparison of 5-Point and 15-Point Moving-Average Filters');
legend('Clean Signal','Noisy Signal','5-Point Filter','15-Point Filter');

saveas(gcf,'filter_comparison.png');