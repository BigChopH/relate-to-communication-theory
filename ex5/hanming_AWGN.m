clc;
clear;

N=10000;
pb=zeros(1,8);
D=zeros(N,4);

for i=1:N
    for j=1:4
        p=rand(); 
        if p<0.5
            D(i,j)=0;
        else
            D(i,j)=1;
        end
    end
end


n=1;
for SNR=4:0.1:11
    Noise=10^(log10(1)-SNR/10);
    noise=normrnd(0,Noise,N,7);
    D7=zeros(N,7);
    for i=1:N
        for j=1:4
          D7(i,j)=D(i,j);  
        end
        D7(i,5)=mod((D(i,1)+D(i,2)+D(i,3)),2);
        D7(i,6)=mod((D(i,2)+D(i,3)+D(i,4)),2);
        D7(i,7)=mod((D(i,1)+D(i,2)+D(i,4)),2);
    end
    for i=1:N  
        for j=1:7
            if D7(i,j)>0
                D7(i,j)=1;
            else
                D7(i,j)=-1;
            end
        end
    end
    
    %加入噪声
    D7=D7+noise;
    %BPSK判决
    for i=1:N  
        for j=1:7
            if D7(i,j)>0
                D7(i,j)=1;
            else
                D7(i,j)=0;
            end
        end
    end
    for i=1:N   
          s1=mod(D7(i,1)+D7(i,2)+D7(i,3)+D7(i,5),2);
          s2=mod(D7(i,2)+D7(i,3)+D7(i,4)+D7(i,6),2);
          s3=mod(D7(i,1)+D7(i,2)+D7(i,4)+D7(i,7),2);
          w=[1 0 1;1 1 1; 1 1 0;0 1 1;1 0 0;0 1 0;0 0 1];
          wrongresult=w*[s1 s2 s3]';
          result(i,:)=mod(D7(i,:)+wrongresult',2);
    end
    decode=zeros(N,4);
    for i=1:N
       for j=1:4
          decode(i,j)=result(i,j); 
       end
    end
    dif=decode-D;

    pb(1,n)=numel(dif,(dif~=0))/N/4;
    n=n+1;
end
SNR=4:0.1:11;
semilogy(SNR,pb);
xlabel('Eb/N0')
ylabel('纠正后误比特率')
