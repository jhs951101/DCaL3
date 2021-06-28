clear all;
close all;

ts = 0.1;
time = -5 : ts : 5;
tau = 2;  % tau: �ﰢ �޽��� ǥ���ϱ� ���� ���Ǵ� Ÿ��(��)
fs = 1/ts;

A = 1;

x = Function_201401793_Triangular(time, ts, tau);  % x: �ﰢ �޽�

X = fft(x);  % X: �ﰢ �޽� x�� Ǫ���� ��ȯ(FFT)�� ��
X = abs(X);  % �ﰢ �޽� x�� Ǫ���� ��ȯ ����
X = X * ts;

X = fftshift(X);

N = 512;
df = fs/N;

frequency = -df/2*(length(x)) : df : df/2*(length(x)-1);

figure
subplot(211), stairs(time, x);
axis([-inf inf -0.5 1.5]); grid on;
xlabel('time [sec]');
title(' x(t) = triangle(t) ');

subplot(212), stem(frequency, X);
axis([-inf inf -0.5 max(X)*1.5]); grid on;
xlabel('frequency [Hz]');
title(' X(f) = fft(x(t)) ');