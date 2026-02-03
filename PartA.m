%% Time space for simulation
fc = 5e3; % Carrier frequency in Hz
fs = 1000 * fc; % Sampling frequency (50 kHz) 1000 times the frequency of the carrier for better visualization
Ts = 1 / fs; % Sampling period
T = 0.004; % Total simulation time (4 ms)
t = 0:Ts:T; % Time vector

%% Generating the Carrier Signals.
c1 = cos(2*pi*fc*t);  
c2 = sin(2*pi*fc*t);

%% Generating the Message signals
fm1 = 1000; % Frequency of m1 in Hz
Tm2 = 2e-3; % Period of m2 in seconds
fm2 = 1 / Tm2; % Frequency of m2 in Hz

m1 = sawtooth((2*pi*fm1*t) + pi, 0); % Corrected to start from 0
m2 = zeros(size(t));
shift = mod(t, Tm2); % Repeat the step function every period

m2(shift < 0.5e-3) = 1;
m2((shift >= 0.5e-3) & (shift < 1e-3)) = 0.5;
m2((shift >= 1e-3) & (shift < 1.5e-3)) = -0.5;
m2(shift >= 1.5e-3) = -1;

figure;
subplot(2,1,1);
plot(t, m1, 'LineWidth', 1.5);
title('Message Signal m_1(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, m2, 'LineWidth', 1.5);
title('Message Signal m_2(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

%% Modulating the Signals using QAM Technique
s = (m1 .* c1) + (m2 .* c2);

figure;
plot(t, s, 'LineWidth', 1.5);
title('Modulated Signal s(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

%% Implementing the QAM Receiver
% Implementing the carrier signal (normal case)
rc1 = 2 * cos(2*pi*fc*t);  
rc2 = 2 * sin(2*pi*fc*t);
x1 = s .* rc1;
x2 = s .* rc2;



% Design Butterworth low-pass filters
[b1, a1] = butter(4, 2*fm1/(fs/2)); % Filter for m1_demodulated
[b2, a2] = butter(4, 2*fm2/(fs/2)); % Filter for m2_demodulated

% Apply the Butterworth filters
m1_demodulated = filter(b1, a1, x1);
m2_demodulated = filter(b2, a2, x2);



%% POINT 4: Phase Offset at Receiver (π/3)
% New receiver carrier with phase offset
rc1_offset = 2 * cos(2*pi*fc*t + pi/3);
rc2_offset = 2 * sin(2*pi*fc*t + pi/3);

% Multiply the modulated signal with the phase-shifted carrier
x1_offset = s .* rc1_offset;
x2_offset = s .* rc2_offset;

% Apply same filters
m1_phase_offset = filter(b1, a1, x1_offset);
m2_phase_offset = filter(b2, a2, x2_offset);

%% POINT 5: Frequency Offset at Receiver (2.02πfₐt)
fc_offset = 1.01 * fc; % 1% frequency offset
rc1_freq_offset = 2 * cos(2*pi*fc_offset*t);
rc2_freq_offset = 2 * sin(2*pi*fc_offset*t);

% Multiply modulated signal with frequency offset carrier
x1_freq_offset = s .* rc1_freq_offset;
x2_freq_offset = s .* rc2_freq_offset;

% Filter to demodulate
m1_freq_offset = filter(b1, a1, x1_freq_offset);
m2_freq_offset = filter(b2, a2, x2_freq_offset);

% Plot the demodulated signals
figure;
subplot(2,1,1);
plot(t, m1_demodulated, 'LineWidth', 1.5);
title('Demodulated Message Signal m1(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, m2_demodulated, 'LineWidth', 1.5);
title('Demodulated Message Signal m2(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

% Plot the demodulated signals with phase offset
figure;
subplot(2,1,1);
plot(t, m1_phase_offset, 'LineWidth', 1.5);
title('Demodulated m1(t) with Phase Offset \pi/3');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, m2_phase_offset, 'LineWidth', 1.5);
title('Demodulated m2(t) with Phase Offset \pi/3');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

% Plot the demodulated signals with frequency offset
figure;
subplot(2,1,1);
plot(t, m1_freq_offset, 'LineWidth', 1.5);
title('Demodulated m1(t) with Frequency Offset 2.02\pi f_c');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, m2_freq_offset, 'LineWidth', 1.5);
title('Demodulated m2(t) with Frequency Offset 2.02\pi f_c');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;
