function [ L ] = quant( n,N,V )
%UNTITLED3 此处显示有关此函数的摘要
%   将样值n进行N级量化并得到量化级L
d=2/(2^N);
L=floor((n+V)/d);

end

