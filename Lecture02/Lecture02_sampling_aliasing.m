%% Lecture 02 - Sampling and Aliasing
% This script investigates the effect of sampling frequency
% on a 10 Hz sine wave.

clear;
clc;
close all;

%% Signal parameters
f = 10;              % Signal frequency in Hz
T = 1;               % Signal duration in seconds

% Small time step for a close approximation to continuous time
dt = 0.0001;
t = 0:dt:T;

% Original continuous-time signal
x = sin(2*pi*f*t);
%% Task 1 - Original Signal

figure;

plot(t, x, 'LineWidth', 1.5);

title('Original 10 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
legend('10 Hz sine wave');

saveas(gcf, 'original_signal.png');
%% Task 2 - Sampling Investigation

sampling_frequencies = [15 20 25 50 100];

for k = 1:length(sampling_frequencies)

    fs = sampling_frequencies(k);

    % Sampling period
    Ts = 1/fs;

    % Sampled time vector
    ts = 0:Ts:T;

    % Sampled signal
    xs = sin(2*pi*f*ts);

    % Create figure
    figure;

    % Plot original signal
    plot(t, x, 'LineWidth', 1.5);
    hold on;

    % Plot sampled points
    stem(ts, xs, 'filled');

    title(['10 Hz Signal Sampled at ', num2str(fs), ' Hz']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Original signal', 'Samples');
    grid on;

    hold off;

    % Save figure
    filename = ['sampling_', num2str(fs), 'Hz.png'];
    saveas(gcf, filename);

end