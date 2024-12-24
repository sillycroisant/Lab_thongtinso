im = imread('img1.jpg');
gray_img = rgb2gray(im); imwrite(gray_img,'gray_img.png');

figure;
subplot(121); imshow(im); title('Color img');
subplot(122); imshow(gray_img); title('Gray img');

G = dir('gray_img.png'); G.bytes

figure;
%Lay mau moi 2 bit
im2bit = sampling(gray_img,2);
subplot(221); imshow(im2bit);
title('2 bits sample');
imwrite(im2bit,'samp2.png');
samp2 = dir('samp2.png'); samp2.bytes

%Lay mau moi 4 bit
im4bit = sampling(gray_img,4);
subplot(222); imshow(im4bit);
title('4 bits sample')
imwrite(im4bit,'samp4.png');
samp4 = dir('samp4.png'); samp4.bytes

%Lay mau moi 8 bits
im8bit = sampling(gray_img,8);
subplot(223); imshow(im8bit); 
title('8 bits sample');
imwrite(im8bit,'samp8.png');
samp8 = dir('samp8.png'); samp8.bytes

%Lay mau moi 16 bits
im16bit = sampling(gray_img,16);
subplot(224); imshow(im16bit); 
title('16 bits sample');
imwrite(im16bit,'samp16.png');
samp16 = dir('samp16.png'); samp16.bytes