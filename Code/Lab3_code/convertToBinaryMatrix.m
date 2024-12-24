function binaryMatrix2 = convertToBinaryMatrix(inputString,n)

    binaryString = '';
    for i = 1:length(inputString)
        % Chuyển đổi mỗi ký tự thành mã ASCII
        asciiCode = uint8(inputString(i));
        % Chuyển mã ASCII thành chuỗi nhị phân
        binaryChar = dec2bin(asciiCode, 7);
        % Nối chuỗi nhị phân của từng ký tự vào chuỗi tổng
        binaryString = [binaryString, binaryChar];
    end
    numRows = ceil(length(binaryString) / n);
    binaryMatrix=zeros(numRows,n);
    if(n==4)
        for i=1:numRows
        binaryMatrix(i,1)=binaryString((4*(i-1)+1));
        binaryMatrix(i,2)=binaryString((4*(i-1)+2));
        binaryMatrix(i,3)=binaryString((4*(i-1)+3));
        binaryMatrix(i,4)=binaryString((4*(i-1)+4));
        end
    elseif(n==7)
        for i=1:numRows
        binaryMatrix(i,1)=binaryString((7*(i-1)+1));
        binaryMatrix(i,2)=binaryString((7*(i-1)+2));
        binaryMatrix(i,3)=binaryString((7*(i-1)+3));
        binaryMatrix(i,4)=binaryString((7*(i-1)+4));
        binaryMatrix(i,5)=binaryString((7*(i-1)+5));
        binaryMatrix(i,6)=binaryString((7*(i-1)+6));
        binaryMatrix(i,7)=binaryString((7*(i-1)+7));
        end
    end

    binaryMatrix2=mod(binaryMatrix,2);
end


