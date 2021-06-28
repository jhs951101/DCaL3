clear all;
close all;

ts = 0.1;  % ts: �ð� ������ ��ŭ ��ȭ�ϴ����� �ǹ��ϴ� �� (ǥ��ȭ �ֱ�)
time = -5 : ts : 5;  % time: -5 ~ 5 ������ �ð� ������ ts(0.01)��ŭ ��ȭ�ϴ� ���� ǥ���ϱ� ���� �ð� ����
tau = 2;  % tau: �簢 �޽��� ǥ���ϱ� ���� ���Ǵ� Ÿ��(��)
fs = 1/ts;  % fs: ���ø� ���ļ�(sampling frequency)

x = Function_201401793_Rect(time, ts, tau);  % x: �簢 �޽�

X = fft(x);  % X: �簢 �޽� x�� Ǫ���� ��ȯ(FFT)�� ��
X = abs(X);  % �簢 �޽� x�� Ǫ���� ��ȯ ����
X = X * ts;

X = fftshift(X);  % ��ǥ�迡 ǥ���� X�� ���ʰ� ���������� 2��� �� ���� ���� �¹ٲ�

N = 512;  % N: Ǫ���� ��ȯ ǥ�� �� (FFT ǥ�� ��)
df = fs/N;

frequency = -df/2*(length(x)) : df : df/2*(length(x)-1);  % �簢 �޽� x�� Ǫ���� ��ȯ�� ���� ��ǥ�迡 ǥ���ϱ� ���� frequency ���� ��������

figure
subplot(211), stairs(time, x);  % �簢 �޽� x�� ��ǥ�迡 ǥ��
axis([-inf inf -0.5 1.5]); grid on;
xlabel('time [sec]');
title(' x(t) = rect(t) ');

subplot(212), stem(frequency, X);  % �簢 �޽� x�� Ǫ���� ��ȯ�� ���� ��ǥ�迡 ǥ��
axis([-inf inf -0.5 max(X)*1.5]); grid on;  % x���� -inf ~ inf ���̿��� ǥ��
                                            % y���� -0.5 ~ (X�� �ִ밪) * 1.5 ���̿��� ǥ��
xlabel('frequency [Hz]');  % x�༱ ��ó�� 'frequency [Hz]'��� ������ �߰���
title(' X(f) = fft(x(t)) ');  % ������ 'X(f) = fft(x(t))'��� ������