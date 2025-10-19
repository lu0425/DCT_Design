clear;
clear all;
clc;

X = randi([0,256], 8, 1); % 8 inputs

s = pi/16;
c1 = cos(s);   c1_ = -c1;
c2 = cos(2*s); c2_ = -c2;
c3 = cos(3*s); c3_ = -c3;
c4 = cos(4*s); c4_ = -c4;
c5 = cos(5*s); c5_ = -c5;
c6 = cos(6*s); c6_ = -c6;
c7 = cos(7*s); c7_ = -c7;

C = [c4 c4 c4 c4 c4 c4 c4 c4;
     c1 c3 c5 c7 c7_ c5_ c3_ c1_;
     c2 c6 c6_ c2_ c2_ c6_ c6 c2;
     c3 c7_ c1_ c5_ c5 c1 c7 c3_;
     c4 c4_ c4_ c4 c4 c4_ c4_ c4;
     c5 c1_ c7 c3 c3_ c7_ c1 c5_;
     c6 c2_ c2 c6_ c6_ c2 c2_ c6;
     c7 c5_ c3 c1_ c1 c3_ c5 c7_];

Z = C * X; % floating point result

for L = 1:15
    C_f = floor(C * 2^L) / 2^L;  % quantize C matrix
    Z_f = C_f * X;               % calculate using quantized coefficients
    Error = Z - Z_f;              
    signal = sum(Z.^2);           
    noise = sum(Error.^2);        
    
    if noise == 0
        sqnr(L) = inf;
    else
        sqnr(L) = 10 * log10(signal / noise);
    end
end

% inf values
sqnr(isinf(sqnr)) = max(sqnr(~isinf(sqnr))) + 10;

bar(sqnr);
xlabel('L');
ylabel('SQNR (dB)');
grid off;
xlim([0 16]);