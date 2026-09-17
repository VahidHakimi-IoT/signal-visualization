%% Task 1: Create a Sine Wave

% Parameters
A = 1;              % Amplitude
f = 5;              % Frequency in Hz
duration = 1;       % Duration in seconds

% Time vector
t = 0:0.001:duration;

% Generate sine wave
x = A * sin(2*pi*f*t);

% Plot the sine wave
figure;
plot(t, x);

title('5 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

%% Task 2: Compare Different Frequencies

% Frequencies
f1 = 2;
f2 = 5;
f3 = 10;

% Generate the signals
signal_2Hz = sin(2*pi*f1*t);
signal_5Hz = sin(2*pi*f2*t);
signal_10Hz = sin(2*pi*f3*t);

% Create the figure
figure;

subplot(3,1,1);
plot(t, signal_2Hz);
title('2 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, signal_5Hz);
title('5 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, signal_10Hz);
title('10 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

sgtitle('Frequency Comparison');

% Save the figure
saveas(gcf, 'frequency_comparison.png');
%% Task 3: Compare Different Amplitudes

% Same frequency for all signals
frequency = 5;

% Generate signals with different amplitudes
amplitude_05 = 0.5 * sin(2*pi*frequency*t);
amplitude_1 = 1 * sin(2*pi*frequency*t);
amplitude_2 = 2 * sin(2*pi*frequency*t);

% Create the figure
figure;

subplot(3,1,1);
plot(t, amplitude_05);
title('Amplitude = 0.5');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, amplitude_1);
title('Amplitude = 1');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, amplitude_2);
title('Amplitude = 2');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

sgtitle('Amplitude Comparison');

% Save the figure
saveas(gcf, 'amplitude_comparison.png');
%% Task 4: Add Noise

% Create a clean 5 Hz sine wave
clean_signal = sin(2*pi*5*t);

% Generate random noise
noise = 0.3 * randn(size(t));

% Add noise to the clean signal
noisy_signal = clean_signal + noise;

% Create the figure
figure;

subplot(2,1,1);
plot(t, clean_signal);
title('Clean 5 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, noisy_signal);
title('Noisy 5 Hz Sine Wave');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

sgtitle('Clean vs Noisy Signal');

% Save the figure
saveas(gcf, 'clean_vs_noisy_signal.png');