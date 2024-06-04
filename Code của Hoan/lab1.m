close all, clearvars, clc;

I = imread('img1.jpg');
[m, n, ~] = size(I);
I1 = I;
I1(2:2:m,2:2:n,:) = I(1:2:m,1:2:n,:);
I1(1:2:m,2:2:n,:) = I(1:2:m,1:2:n,:);
I1(2:2:m,1:2:n,:) = I(1:2:m,1:2:n,:);

I2 =uint8(floor(double(I)/32)*32);
I3 =uint8(floor(double(I1)/32)*32) ;


imwrite(I,'anhvet1.png');
s1=dir('anhvet1.png');

imwrite(I1,'anhvet2.png');
s2=dir('anhvet2.png');

imwrite(I2,'anhvet3.png');
s3=dir('anhvet3.png');


imwrite(I3,'anhvet4.png');
s4=dir('anhvet4.png');

% Hi?n th? b?c ?nh và kích thý?c c?a nó trong tiêu ð? c?a subplot
figure
subplot(221); imshow(I); title(['Original Image (',string(s1.bytes), ' bytes)']);
subplot(222); imshow(I1); title(['Sau l?y m?u (',string(s2.bytes), ' bytes)']);
subplot(223); imshow(I2); title(['Sau lý?ng t? hoá (',string(s3.bytes), ' bytes)']);
subplot(224); imshow(I3); title(['Lý?ng t? hoá + l?y m?u (',string(s4.bytes), ' bytes)']);

