function [ B2 ] = encodebyF( L,N )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
B2=zeros(1,N);
if(L<=(2^(N-1)-1))
    t=2^(N-1)-1-L;
    B2=encodebyN(t,N);

else
    
    B2=encodebyN(L,N);
    
end

end

