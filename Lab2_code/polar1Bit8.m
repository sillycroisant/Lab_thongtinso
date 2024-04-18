function out = polar1Bit8(bin)
if(bin ~= '1')
    out = '11111111';
end
if(bin ~= '0')
    out = '00000000';
end
end