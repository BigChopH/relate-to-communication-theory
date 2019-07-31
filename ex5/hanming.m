clc;
clear;

N=10000;%�볤��
D=zeros(N,4);

%�������2����λ
for i=1:N
    for j=1:4
        t=rand(); 
        if t<=0.5
            D(i,j)=0;
        else
            D(i,j)=1;
        end
    end
end

n=1;
pe=0.000001;
while pe<=0.1
    D7=zeros(N,7);%7λ�����
    for i=1:N
        for j=1:4
          D7(i,j)=D(i,j);  
        end
        D7(i,5)=mod((D(i,1)+D(i,2)+D(i,3)),2); %д�����λУ��λ
        D7(i,6)=mod((D(i,2)+D(i,3)+D(i,4)),2);
        D7(i,7)=mod((D(i,1)+D(i,2)+D(i,4)),2);
    end
    D7_e=D7;
    %�����漴���
    for i=1:N
         for j=1:7
            t=rand(); 
            if t<pe
                D7_e(i,j)=~D7(i,j);
            end
        end
    end
    result=zeros(N,7);
    for i=1:N   
          %����У����
          s1=mod(D7_e(i,1)+D7_e(i,2)+D7_e(i,3)+D7_e(i,5),2);
          s2=mod(D7_e(i,2)+D7_e(i,3)+D7_e(i,4)+D7_e(i,6),2);
          s3=mod(D7_e(i,1)+D7_e(i,2)+D7_e(i,4)+D7_e(i,7),2);
          w=[1 0 1;1 1 1; 1 1 0;0 1 1;1 0 0;0 1 0;0 0 1];
          %�����������
          w_b=w*[s1 s2 s3]';
          %������ؾ���
          result(i,:)=mod(D7_e(i,:)+w_b',2);
    end
    decode=zeros(N,4);
%     for i=1:N
%        for j=1:4
%           decode(i,j)=result(i,j); 
%        end
%     end
    decode=result(:,1:4);
    
    dif=decode-D;

    pb(1,n)=numel(dif,(dif~=0))/N/4;%����������
    n=n+1;
    pe=pe*10;
end

pe=logspace(-6,-1,6);
loglog(pe,pb);
set(gca,'XDir','reverse');
xlabel('�ŵ��������')
ylabel('�������������')

