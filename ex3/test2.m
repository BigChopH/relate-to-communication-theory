
dbW=--62; 
N=11;

W=10^(dbW/10);
V=sqrt(3*W);     %假设输入正弦信号，平均功率V^2/2，从-V到V取10000个样值
n=zeros(1,10000);%原值
L=zeros(1,10000);%量化级
n1=zeros(1,10000);%存自然码的恢复值
n2=zeros(1,10000);%存折叠码的恢复值

B1=zeros(10000,N);%自然码编码
B2=zeros(10000,N);%折叠码编码


for i=1:10000                             %编码
    n(i)=-V+(i-1)*2*V/10000;
    L(i)=quant(n(i),N,V);
    B1(i,:)=encodebyN(L(i),N);
    B2(i,:)=encodebyF(L(i),N);
end
                %随机产生一位误码 !
% for j=1:N
%     for i=1:10000
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
% end
e1=zeros(1,10000);
e2=zeros(1,10000);
for i=1:10000
    n1(i)=decodebyN(B1(i,:),N,V);
    n2(i)=decodebyF(B2(i,:),N,V);
    e1(i)=(n1(i)-n(i))^2;
    e2(i)=(n2(i)-n(i))^2;
end

E1=(sum(e1(:))/10000);
E2=(sum(e2(:))/10000);

SNR1=10*log10(W/E1);
SNR2=10*log10(W/E2);






