clc; close all; clearvars;

%Input image
name = 'nhom12a.bmp';
im = imread(name);

%Turn it into Grayscale image
gray = rgb2gray(im);

%Plot its histogram
%histogram(gray);

%Extract size of image 
[row, col] = size(gray);

%Choose a threshold value
T = 120;

%Segment the img
bw = zeros(size(gray));
bw(gray > T) = 255; 
bw(gray <= T) = 0; 

%figure;
%imshow(uint8(bw)), title('origin img');

code = [];
encode = zeros(size(bw));
counter = 1;

for i=1:row
    line = [];
    for j=1:(col-1)
        %Run-length coding
        if(bw(i,j) == bw(i,j+1))
            counter = counter + 1;
            if(j == 249)
                line = [line,dec2bin(counter),polar8Bit1(bw(i,j))];
                counter = 1;
            end
        else
            line = [line,dec2bin(counter),polar8Bit1(bw(i,j))];
        counter = 1;
        end
    end
    code = [code, line];
    for k=1:9:length(line)
        startPos = 1;
        endPos = startPos + bin2dec(line(k:k+7))-1;
        colr = bin2dec(polar1Bit8(line(k+8)));
        encode(i,startPos:endPos) = colr;
        startPos = endPos;
    end
end
    

figure; 
subplot(121), imshow(bw), title('origin img');
subplot(122), imshow(encode), title('encoded img');
        
        