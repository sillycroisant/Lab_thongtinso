function bai1a(name)
im = imread(name);
gray_img = rgb2gray(im);

figure;
subplot(121); imshow(im); title('Color img');
subplot(122); imshow(gray_img); title('Gray img');

figure;
%Lay mau moi 2 bit
im2bit = downSample(gray_img,2);
subplot(231); imshow(im2bit); title('2 bits sample')

%Lay mau moi 4 bit
im3bit = downSample(gray_img,4);
subplot(232); imshow(im3bit); title('4 bits sample')

%Lay mau moi 8 bits
im4bit = downSample(gray_img,8);

subplot(233); imshow(im4bit); title('8 bits sample')

%Lay mau moi 16 bits
im5bit = downSample(gray_img,16);
subplot(234);
imshow(im5bit); title('16 bits sample')

%Lay mau moi 32 bits
im6bit = downSample(gray_img,32);
subplot(235); imshow(im6bit); title('32 bits sample')

%Lay mau moi 64 bits
im7bit = downSample(gray_img,64);
subplot(236); imshow(im7bit); title('64 bits sample')

end
