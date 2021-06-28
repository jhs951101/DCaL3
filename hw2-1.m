clear all;
close all;

ts = 0.01;
time = -5 : ts : 5;
tau = 2;

x = Function_201401793_Rect(time, ts, tau);  % x: �簢 �޽�
y2 = conv(x, x) * ts;  % y2 = x * x (�� �簢 �޽� x�� ���� ������� �� ��)

figure
plot(time, x);  % �簢 �޽� x�� ��ǥ�迡 ǥ��
hold on;

plot(-10:ts:10, y2);  % �� �簢 �޽� x�� ���� ������� �� ���� ��ǥ�迡 ǥ��
grid on;

axis([min(time), max(time), -0.5, 2.5]);
xlabel('time[sec]');
title('x(t) = rect(t) & x(t) * x(t)');
legend('x(t) = rect(t)', 'x(t) * x(t)');