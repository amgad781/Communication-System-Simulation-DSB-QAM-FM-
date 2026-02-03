%% Time space for simulation
fc = 10e3; % Carrier frequency in Hz
fs = 1000 * fc; % Sampling frequency (10 MHz)
Ts = 1 / fs; % Sampling period
T = 0.004; % Total simulation time (4 ms)
t = 0:Ts:T; % Time vector
Ac = 1;

%% Generating the Message Signals
fm1 = 1000; % Frequency of m1 in Hz
Tm2 = 2e-3; % Period of m2 in seconds
fm2 = 1 / Tm2; % Frequency of m2 in Hz

m1 = sawtooth((2*pi*fm1*t) + pi, 0); % Sawtooth wave for m1
m2 = zeros(size(t)); % Step function for m2
shift = mod(t, Tm2); % Repeat every Tm2

% Step levels for m2
m2(shift < 0.5e-3) = 1;
m2((shift >= 0.5e-3) & (shift < 1e-3)) = 0.5;
m2((shift >= 1e-3) & (shift < 1.5e-3)) = -0.5;
m2(shift >= 1.5e-3) = -1;

%% Frequency Modulation using m2(t), m1(t)
Kf = 1000; % Frequency sensitivity
Kf3 = 2000;

% Integrate m2(t) over time
int_m1 = cumsum(m1) * Ts;
int_m2 = cumsum(m2) * Ts; % Numerical integration

% Frequency modulated signal
s2 = Ac * cos(2*pi*fc*t + Kf * int_m2);
s3 = Ac * cos(2*pi*fc*t + Kf3 * int_m1);

%% Plot Message Signals
figure;
subplot(2,1,1);
plot(t*1000, m1, 'LineWidth', 1.5);
title('Message Signal m_1(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t*1000, m2, 'LineWidth', 1.5);
title('Message Signal m_2(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

%% Phase Modulation for different values of Kp
Kp_values = [0.05, 1, 5, 10];

figure;
for i = 1:length(Kp_values)
    Kp = Kp_values(i);
    s1 = Ac * cos(2*pi*fc*t + Kp .* m1); % Phase modulation
    
    subplot(length(Kp_values),1,i);
    plot(t*1000, s1, 'LineWidth', 1.2);
    title(['Phase Modulated Signal s_1(t) with K_p = ', num2str(Kp)]);
    xlabel('Time (ms)');
    ylabel('Amplitude');
    grid on;
end

% Plot FM Signal
figure;
plot(t*1000, s2, 'LineWidth', 1.5);
title('Frequency Modulated Signal s_2(t) using m_2(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

% Plot FM Signal using m1(t)
figure;
plot(t*1000, s3, 'LineWidth', 1.5);
title('Frequency Modulated Signal s_3(t) using m_1(t)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

