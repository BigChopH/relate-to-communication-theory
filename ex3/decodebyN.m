function [ n1 ] = decodebyN( B1,N,V )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
L=0;
for i=1:N
    L=L+B1(N-i+1)*2^(i-1);
end
n1=-V+L*2/(2^N)+0.5*2/(2^N);
end

