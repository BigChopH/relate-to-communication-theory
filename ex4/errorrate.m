clc
clear
N=1e5;
D1=zeros(1,N);  %单极性非归零
D2=zeros(1,N);  %双极性非归零
DwithN_1=D1;
DwithN_2=D2;
re1=D1;
re2=D2;
A=3;
errct1=zeros(1,21);
errct2=zeros(1,21);
for s=-5:15
    p=10^(s/10);
    
    for i=1:N
        if(rand(1)>=0.5)
            D1(i)=A;
            D2(i)=A;
        else
            D1(i)=0;
            D2(i)=-A;
        end
    end
    totP1=0;
    totP2=0;
    for i=1:N
        totP1=totP1+(D1(i))^2;
        totP2=totP2+(D2(i))^2;
    end
    
    totP1=totP1/N;
    totP2=totP2/N;
    
    PofN1=totP1/p; %噪声功率
    PofN2=totP2/p;
    
    err1=sqrt(PofN1);
    err2=sqrt(PofN2);
    
    for i=1:N
        DwithN_1(i)=D1(i)+rand(1)*err1;
        DwithN_2(i)=D2(i)+rand(1)*err2;
        if (abs(DwithN_1(i)-0)>abs(DwithN_1(i)-A))
            re1(i)=A;
        else
            re1(i)=0;
        end
        if (abs(DwithN_2(i)+A)>=abs(DwithN_2(i)-A))
            re2(i)=A;
        else
            re2(i)=-A;
        end
    end
    
  
   
   for i=1:N
       if (re1(i)~=D1(i))
           errct1((s+6))=errct1((s+6))+1;
       end
       if (re2(i)~=D2(i))
           errct2((s+6))=errct2((s+6))+1;
       end
   end
   
end

errct1=errct1/N*100;
errct2=errct2/N*100;
x=-5:1:15;

plot(x,errct1,'-or',x,errct2,'-og');
xlabel('输入信噪比/dB');
ylabel('误码率/%');
grid on;
legend('单极性','双极性');
text(x,errct1,num2str([errct1].','%.2f'))
text(x,errct2,num2str([errct2].','%.2f'))
