function out = dec2bin(dec)
%8bit decimal (0-255)
out = [];
for i=1:8
    rem = mod(dec,2);
    out = [num2str(rem),out];
    dec = (dec-rem)/2;
end
end