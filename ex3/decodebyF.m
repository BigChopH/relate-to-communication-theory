function [ n2 ] = decodebyF( B2,N,V )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
if(B2(1)==1)
    n2=decodebyN(B2,N,V);
    
else
    for i=2:N
        if(B2(i)==1)
            B2(i)=0;
        else
            B2(i)=1;
        end
        n2=decodebyN(B2,N,V);
    end
end

end

