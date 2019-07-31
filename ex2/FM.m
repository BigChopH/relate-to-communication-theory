%AM
fm=1000;              %�����ź�Ƶ��1kHz
fc=20000;             %�ز�Ƶ��20kHz
dt=0.000001;           %�������0.00001
t=[0:3999]*dt;         %����400���㣬��4�������ź�����

mt=cos(2*pi*fm*t);    %�����źŲ���
subplot(511);
plot(t,mt);
title('�����ź�');

ct=cos(2*pi*fc*t);            %�ز�����
subplot(512);
plot(t,ct);
title('�ز�');
axis([0 0.004 -1.5 1.5]);

Sfm=cos(2*pi*fc*t+100000/(2*pi*fm)*sin(2*pi*fm*t)); %�ѵ��źţ�KFM=100000(Mf=100/2pi),����A=1���ز�����Ϊ0
subplot(513);
plot(t,Sfm);
title('�ѵ��ź�');


fs=256000;   %4e-3����źŽ���1024������������Ƶ��Ϊ256000
N=1024;
y=fft(Sfm,N);
n=0:N-1;
f=n*fs/N;
mag=abs(y);

subplot(514);
plot(2*f(1:N/2),mag(1:N/2)*2/N);
title('Ƶ��');


