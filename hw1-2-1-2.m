clear all;
close all;

ts = 0.1;
time = -5 : ts : 5;
tau = 2;
fs = 1/ts;

x = Function_201401793_Rect(time, ts, tau);

X = fft(x);
X = abs(X);
X = X * ts;

X = fftshift(X);

N = 256;  % (����)
df = fs/N;

frequency = -df/2*(length(x)) : df : df/2*(length(x)-1);

figure
subplot(211), stairs(time, x);
axis([-inf inf -0.5 1.5]); grid on;
xlabel('time [sec]');
title(' x(t) = rect(t) ');

subplot(212), stem(frequency, X);
axis([-inf inf -0.5 max(X)*1.5]); grid on;
xlabel('frequency [Hz]');
title(' X(f) = fft(x(t)) ');