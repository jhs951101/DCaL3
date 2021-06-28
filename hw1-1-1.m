clear all;
close all;

ts = 0.1;  % ts: 시간 내에서 얼만큼 변화하는지를 의미하는 값 (표본화 주기)
time = -5 : ts : 5;  % time: -5 ~ 5 사이의 시간 내에서 ts(0.01)만큼 변화하는 것을 표현하기 위한 시간 변수
tau = 2;  % tau: 사각 펄스를 표현하기 위해 사용되는 타우(τ)
fs = 1/ts;  % fs: 샘플링 주파수(sampling frequency)

x = Function_201401793_Rect(time, ts, tau);  % x: 사각 펄스

X = fft(x);  % X: 사각 펄스 x를 푸리에 변환(FFT)한 값
X = abs(X);  % 사각 펄스 x를 푸리에 변환 해줌
X = X * ts;

X = fftshift(X);  % 좌표계에 표현한 X를 왼쪽과 오른쪽으로 2등분 한 다음 서로 맞바꿈

N = 512;  % N: 푸리에 변환 표본 수 (FFT 표본 수)
df = fs/N;

frequency = -df/2*(length(x)) : df : df/2*(length(x)-1);  % 사각 펄스 x를 푸리에 변환한 값을 좌표계에 표현하기 위해 frequency 값을 설정해줌

figure
subplot(211), stairs(time, x);  % 사각 펄스 x를 좌표계에 표현
axis([-inf inf -0.5 1.5]); grid on;
xlabel('time [sec]');
title(' x(t) = rect(t) ');

subplot(212), stem(frequency, X);  % 사각 펄스 x를 푸리에 변환한 값을 좌표계에 표현
axis([-inf inf -0.5 max(X)*1.5]); grid on;  % x축은 -inf ~ inf 사이에서 표현
                                            % y축은 -0.5 ~ (X의 최대값) * 1.5 사이에서 표현
xlabel('frequency [Hz]');  % x축선 근처에 'frequency [Hz]'라는 문구를 추가함
title(' X(f) = fft(x(t)) ');  % 제목을 'X(f) = fft(x(t))'라고 설정함