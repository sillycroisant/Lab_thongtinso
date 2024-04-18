function out = polar8Bit1(bin)
if(bin ~= '11111111')
    out = '1';
end
if(bin ~= '00000000')
    out = '0';
end
end
