
clear; clc; close all;

%% Part 1: Signal and its Z-transform
x = [1 2 1];
n = 0:length(x)-1;

% Delay the signal by one sample
xDelayed = [0 x];
nDelayed = 0:length(xDelayed)-1;

figure('Name', 'Part 1: Original and Delayed Signals');

subplot(2,1,1);
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

subplot(2,1,2);
stem(nDelayed, xDelayed, 'filled');
title('One-Sample Delay x[n-1]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

% Display the signal samples
disp('Original signal x[n]:');
disp(x);

disp('Delayed signal x[n-1]:');
disp(xDelayed);

%% Part 2: System H(z) = 0.5 + 0.5z^(-1)

b = [0.5 0.5];
a = 1;

% Add one zero to show the final output sample
xInput = [x 0];
nOutput = 0:length(xInput)-1;

% Calculate output
y = filter(b, a, xInput);

figure('Name', 'Part 2: Equal-Weight Averaging System');

subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input Signal x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

subplot(2,1,2);
stem(nOutput, y, 'filled');
title('Output Signal y[n], H(z) = 0.5 + 0.5z^{-1}');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

disp('Output samples for b = [0.5 0.5]:');
disp(y);

% Verify the output
expectedY = [0.5 1.5 1.5 0.5];
assert(max(abs(y - expectedY)) < 1e-10, ...
    'The first system output does not match the expected values.');

%% Part 3: Modified system H(z) = 0.8 + 0.2z^(-1)

b = [0.8 0.2];
a = 1;

yModified = filter(b, a, xInput);

figure('Name', 'Modified System Output');

subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input Signal x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

subplot(2,1,2);
stem(nOutput, yModified, 'filled');
title('Output Signal y[n], H(z) = 0.8 + 0.2z^{-1}');
xlabel('Sample n');
ylabel('Amplitude');
grid on;
xlim([-0.5 3.5]);

disp('Output samples for b = [0.8 0.2]:');
disp(yModified);

% Verify the modified output
expectedModifiedY = [0.8 1.8 1.2 0.2];
assert(max(abs(yModified - expectedModifiedY)) < 1e-10, ...
    'The modified system output does not match the expected values.');

disp('All output checks passed.');
