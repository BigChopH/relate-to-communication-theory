%DSB
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

Sdsb=mt.*cos(2*pi*fc*t);  %已调信号波形 抑制载波调幅中，调制信号不经直流抬高
subplot(513);
plot(t,Sdsb);
title('已调信号');
axis([0 0.004 -2 2]);

So1=Sdsb.*ct;                %用ct进行相干解调,下变频
subplot(514);
plot(t,So1);
title('下变频 滤波前');
axis([0 0.004 -3 3]);

sd=So1;             %低通滤波，幅度补偿， 滤波器仍使用lpf.m
b=Num;
a=1;
so= filter(b,a,sd);
soo=so*2;
subplot(515);
plot(t,soo);
title('低通滤波后');





