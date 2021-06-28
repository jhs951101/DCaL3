clear all;
close all;

ts = 0.1;
time = -5 : ts : 5;
tau = 2;  % tau: »ï°¢ ÆÞ½º¸¦ Ç¥ÇöÇÏ±â À§ÇØ »ç¿ëµÇ´Â Å¸¿ì(¥ó)
fs = 1/ts;

A = 1;

x = Function_201401793_Triangular(time, ts, tau);  % x: »ï°¢ ÆÞ½º

X = fft(x);  % X: »ï°¢ ÆÞ½º x¸¦ Çª¸®¿¡ º¯È¯(FFT)ÇÑ °ª
X = abs(X);  % »ï°¢ ÆÞ½º x¸¦ Çª¸®¿¡ º¯È¯ ÇØÁÜ
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