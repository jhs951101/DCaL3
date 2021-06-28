clear all;
close all;

ts = 0.01;
time = -5 : ts : 5;
tau = 2;

x = Function_201401793_Rect(time, ts, tau);
y2 = conv(x, x) * ts;  % y2 = (x * x) * x (�� �簢 �޽� x�� ���� ������� �� ���� �ٽ� ������� �� ��)
y2 = conv(y2, x) * ts;

figure
plot(time, x);
hold on;

plot(-15:ts:15, y2);  % �� �簢 �޽� x�� ���� ������� �� ���� �ٽ� ������� �� ���� ��ǥ�迡 ǥ��
grid on;

axis([min(time), max(time), -0.5, 3.5]);
xlabel('time[sec]');
title('x(t) = rect(t) & (x(t) * x(t)) * x(t)');
legend('x(t) = rect(t)', '(x(t) * x(t)) * x(t)');