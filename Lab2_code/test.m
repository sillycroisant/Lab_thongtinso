code = '111110100111110100111110100111110100111110100111110100111110100111110100111110100'
encode = ones(250,250);

for i=1:250
    for k=1:9:size(code,2)
        startPos = 1;
        postnumDec = 0;
        nownumDec = bin2dec(code(k:k+7));
        colr = bin2dec(polar1Bit8(code(k+8)));
        for start=(startPos+postnumDec):nownumDec
            encode(i,startPos:nownumDec) = colr;
        end
        if(nownumDec == 250) break;
        end
    end
end

imshow(encode)

postnumDec = 0;
    for k=1:9:size(line,2)
        startPos = 1;
        nownumDec = bin2dec(line(k:k+7));
        colr = bin2dec(polar1Bit8(line(k+8)));

        encode(i,startPos:nownumDec) = colr;
        postnumDec = nownumDec;
        if(nownumDec == 250) break;
        end
    end