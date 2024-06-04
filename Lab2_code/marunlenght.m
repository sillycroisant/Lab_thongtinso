function marunlenght
I=imread('nhom12a.bmp');
I3=rgb2gray(I);
I1=imresize(I3,[250,250]);


I1(I1>90)=255;
I1(I1<=90)=0;


A=codingImage(double(I1));
I2=decodingImage(A);
% Ki?m tra thông tin v? bi?n x
infoI1 = whos('I1');

% Hi?n th? s? byte c?a bi?n x
numBytesI1 = infoI1.bytes;
% Ki?m tra thông tin v? bi?n x
infoI2 = whos('A');

% Hi?n th? s? byte c?a bi?n x
numBytesI2 = infoI2.bytes;
disp(['S? byte c?a bi?n x là: ', num2str(numBytesI1)]);
disp(['S? byte c?a bi?n x là: ', num2str(numBytesI2)]);

figure
subplot(121);imshow(uint8(I1));
subplot(122);imshow(uint8(I2));

end


function codeImage = codingImage(image)
[m,n]=size(image);
codeImage = cell(1, m);%decodingImage

for j=1:m
    l=0;
    k=0;
    i=1;
    A=''; %decodedingImage
    while(i<=n)
        if(image(j,i)>0)
            k=k+1;
            i=i+1;
            if(l~=0)
                A=concatenateBinaryAndDecimal(A,l,'0');
                l=0;
            end
        else
            l=l+1;
            i=i+1;
            if(k~=0)
                A=concatenateBinaryAndDecimal(A,k,'1');
                k=0;
                
            end
        end
    end
    codeImage{j}=A;%decodingImage
end

end

      
function concatenatedBinary = concatenateBinaryAndDecimal(binary, decimal,binary2)
    
    % N?i hai chu?i nh? phân thành m?t chu?i
    concatenatedBinary = [binary decimalToBinary8(decimal) binary2];
end

function decodeImage=decodingImage(codeImage)
k=size(codeImage,2);
I=ones(k,k)*255;
for i=1:k
    A=codeImage(i);
    C=A{1};
    B = num2str(C);
    m=1;
    while ~isempty(B)
        [first8Bits, second8Bit, remainingBits] = splitBinary(B);
        B=remainingBits;
        chiSo=binaryToDecimal(first8Bits);
        if((second8Bit-'1')~=0)
            I(i,m:m+chiSo-1)=0;
        end
        m=m+chiSo;
    end
end
decodeImage=I;
end


function [first8Bits, second8Bit, remainingBits] = splitBinary(binary)
    % Ki?m tra xem chu?i nh? phân có ít nh?t 8 bit không

    % L?y 8 bit ð?u tiên
    first8Bits = binary(1:8);

    % L?y 8 bit ti?p theo
    second8Bit = binary(9);
    
    % L?y ph?n c?n l?i c?a chu?i
    remainingBits = binary(10:end);
end

function decimal = binaryToDecimal(binary)
    % Chuy?n ð?i t? chu?i nh? phân sang giá tr? th?p phân
    decimal = bin2dec(binary);
end
