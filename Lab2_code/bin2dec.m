function dec = bin2dec(bin)
%Apply for 8bit binary digits in string type
dec = 0;
for c=1:size(bin,2)
    if(bin(9-c) == '1')
        dec = dec + 2^(c-1);
    end
end
end