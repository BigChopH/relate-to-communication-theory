%DSB
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

Sdsb=mt.*cos(2*pi*fc*t);  %�ѵ��źŲ��� �����ز������У������źŲ���ֱ��̧��
subplot(513);
plot(t,Sdsb);
title('�ѵ��ź�');
axis([0 0.004 -2 2]);

So1=Sdsb.*ct;                %��ct������ɽ��,�±�Ƶ
subplot(514);
plot(t,So1);
title('�±�Ƶ �˲�ǰ');
axis([0 0.004 -3 3]);

sd=So1;             %��ͨ�˲������Ȳ����� �˲�����ʹ��lpf.m
b=Num;
a=1;
so= filter(b,a,sd);
soo=so*2;
subplot(515);
plot(t,soo);
title('��ͨ�˲���');





