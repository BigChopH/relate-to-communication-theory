function [ B2 ] = encodebyF( L,N )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
B2=zeros(1,N);
if(L<=(2^(N-1)-1))
    t=2^(N-1)-1-L;
    B2=encodebyN(t,N);

else
    
    B2=encodebyN(L,N);
    
end

end

