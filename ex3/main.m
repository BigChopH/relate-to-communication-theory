clc
clear
SNR1=zeros(2,51);
SNR2=zeros(2,51);
T=1;
dbW=-61;
M=50000;
while(T<=51)
dbW=dbW+1; 
    for I=1:2
clearvars -EXCEPT dbW SNR1 SNR2 T I M
N=10+I;

W=10^(dbW/10);
V=sqrt(2*W);     %假设输入正弦信号，平均功率V^2/2，从-V到V取10000个样值
n=zeros(1,M);%原值
L=zeros(1,M);%量化级
n1=zeros(1,M);%存自然码的恢复值
n2=zeros(1,M);%存折叠码的恢复值

B1=zeros(M,N);%自然码编码
B2=zeros(M,N);%折叠码编码


for i=1:M                             %编码
    n(i)=-V+(i-1)*2*V/M;
    if(n(i)>=1)
        n(i)=0.99999999999999999999;
    end
    L(i)=quant(n(i),N,V);
    B1(i,:)=encodebyN(L(i),N);
    B2(i,:)=encodebyF(L(i),N);
end
                %随机产生一位误码 !
% for j=1:N
%     for i=1:M
%         if(rand(1)<=0.00001)
%             if B1(i,j)==1
%                 B1(i,j)=0;
%             else
%                 B1(i,j)=1;
%             end
%         
%             if B2(i,j)==1
%                 B2(i,j)=0;
%             else
%                 B2(i,j)=1;
%             end
%         end
%     end
%end
e1=zeros(1,M);
e2=zeros(1,M);
for i=1:M
    n1(i)=decodebyN(B1(i,:),N,V);
    n2(i)=decodebyF(B2(i,:),N,V);
    e1(i)=(n1(i)-n(i))^2;
    e2(i)=(n2(i)-n(i))^2;
end

E1=(sum(e1(:))/M);
E2=(sum(e2(:))/M);

SNR1(I,T)=10*log10(W/E1);
SNR2(I,T)=10*log10(W/E2);
    end
    T=T+1;
end

x1=-60:1:-10;

%%

plot(x1,smoothts(smoothts(smoothts(SNR1(1,:)))),'-b',x1,smoothts(smoothts(smoothts(SNR2(1,:)))),'-r',x1,smoothts(smoothts(smoothts(SNR1(2,:)))),'-g',x1,smoothts(smoothts(smoothts(SNR2(2,:)))),'-m');
%set(gca,'XTick',[-60:1:-10]) %x轴范围1-6，间隔1
legend('自然码(N=11)','折叠码(N=11)','自然码(N=12)','折叠码(N=12)');
xlabel('输入功率/dBW')
ylabel('输出信噪比/dB')
grid on;
    





