% Ví dụ sử dụng:
inputString = 'HOAN HOANG HUNG HUY PHAT';
disp(inputString);
binaryMatrix = convertToBinaryMatrix(inputString,7); %chuyển đổi kí tự chuyển đi thành ma trận
c=binaryMatrix;         %truyền đi với mã ascii 7 bit
disp(c);
c(1,1)=c(1,1)+1;
c(6,1)=c(6,1)+1;
c(12,1)=c(12,1)+1;
c(17,1)=c(17,1)+1;
c(21,1)=c(21,1)+1;
r=mod(c,2);
disp(r);
dulieu=matrixToString(r);
disp(dulieu);