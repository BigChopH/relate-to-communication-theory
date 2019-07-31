clc
clear

f11=rcosdesign(0.1,8,20,'normal');
f12=rcosdesign(0.4,8,20,'normal');
f13=rcosdesign(0.8,8,20,'normal');
f2=rcosdesign(0.8,8,20,'sqrt');


subplot(2,1,1);

y1=fft(f11,1024);
mag1=abs(y1);
n=0:1023;
f=n/1024;

plot(f(1:512),mag1(513:1024),f(513:1024),mag1(1:512));
grid on;
legend('…˝”‡œ“');
y2=fft(f2,1024);
mag2=abs(y2);
n=0:1023;
f=n/1024;
subplot(2,1,2);
plot(f(1:512),mag2(513:1024),f(513:1024),mag2(1:512));
legend('∏˘…˝”‡œ“');
grid on;

