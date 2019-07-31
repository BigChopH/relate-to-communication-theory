%AM
fm=1000;              %调制信号频率1kHz
fc=20000;             %载波频率20kHz
dt=0.000001;           %采样间隔0.00001
t=[0:3999]*dt;         %采样400个点，即4个调制信号周期

mt=cos(2*pi*fm*t);    %调制信号波形
subplot(511);
plot(t,mt);
title('调制信号');

ct=cos(2*pi*fc*t);            %载波波形
subplot(512);
plot(t,ct);
title('载波');
axis([0 0.004 -1.5 1.5]);

Sfm=cos(2*pi*fc*t+100000/(2*pi*fm)*sin(2*pi*fm*t)); %已调信号，KFM=100000(Mf=100/2pi),幅度A=1，载波初相为0
subplot(513);
plot(t,Sfm);
title('已调信号');


fs=256000;   %4e-3秒的信号进行1024点采样，则采样频率为256000
N=1024;
y=fft(Sfm,N);
n=0:N-1;
f=n*fs/N;
mag=abs(y);

subplot(514);
plot(2*f(1:N/2),mag(1:N/2)*2/N);
title('频谱');


