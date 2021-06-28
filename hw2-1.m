clear all;
close all;

ts = 0.01;
time = -5 : ts : 5;
tau = 2;

x = Function_201401793_Rect(time, ts, tau);  % x: 사각 펄스
y2 = conv(x, x) * ts;  % y2 = x * x (두 사각 펄스 x를 서로 컨볼루션 한 값)

figure
plot(time, x);  % 사각 펄스 x를 좌표계에 표현
hold on;

plot(-10:ts:10, y2);  % 두 사각 펄스 x를 서로 컨볼루션 한 값을 좌표계에 표현
grid on;

axis([min(time), max(time), -0.5, 2.5]);
xlabel('time[sec]');
title('x(t) = rect(t) & x(t) * x(t)');
legend('x(t) = rect(t)', 'x(t) * x(t)');