clear;
clear all;
clc;

s = pi/16;
c1 = cos(s);
c2 = cos(2*s);
c3 = cos(3*s);
c4 = cos(4*s);
c5 = cos(5*s);
c6 = cos(6*s);
c7 = cos(7*s);
a = [c1 c2 c3 c4 c5 c6 c7 ];

for i = 1:numel(a)
    binaryCoeff = dec2bin(floor(a(i) * 2^6), 6);
    fprintf('%s\n', binaryCoeff);
end


    
    