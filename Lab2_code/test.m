code = '111110100111110100111110100111110100111110100111110100111110100111110100111110100';

clc

for i=1:9:length(code)
    startPos = 1;
    endPos = startPos + bin2dec(code(i:i+7))-1;
    colr = bin2dec(polar1Bit8(code(i+8)));
    startPos, endPos, colr
    encode(startPos:endPos) = colr;
    startPos = endPos;
end
