%SSB
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

%�ѵ��źŲ��� ��ϣ�����ر任����Slsb
Slsb=0.5*mt.*ct+0.5*imag(hilbert(mt)).*sin(2*pi*fc*t);
subplot(513);
plot(t,Slsb);
title('�ѵ��ź�');
axis([0 0.004 -1 1]);


So1=Slsb.*ct;                %��ct������ɽ��,�±�Ƶ
subplot(514);
plot(t,So1);
title('�±�Ƶ �˲�ǰ');


sd=So1;             %��ͨ�˲������Ȳ����� �˲�����ʹ��lpf.m
so= filter(Num2,1,sd);
soo=so*4;
subplot(515);
plot(t,soo);
title('��ͨ�˲���');





