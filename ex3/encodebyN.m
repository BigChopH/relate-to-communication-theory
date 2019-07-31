function [ B1 ] = encodebyN( L,N )
%UNTITLED 此处显示有关此函数的摘要
%   将L编为N位2进制自然码
B1=zeros(1,N);
i=N;
while (i>=1)
    if (L==1)
        B1(i)=1;
        break;
    end
    temp=floor(L/2);
    if(temp<(L/2))
        B1(i)=1;
    else
        B1(i)=0;
    end
    L=temp;
    i=i-1;
end

end

