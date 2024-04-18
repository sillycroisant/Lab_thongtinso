function bai1b(img)
img = 'img1.jpg';
im = rgb2gray(imread(img));

figure;
subplot(241);
imshow(im); title('8-bit / gray img');

im7 = quantize(im,7);
im6 = quantize(im,6);
im5 = quantize(im,5);
im4 = quantize(im,4);
im3 = quantize(im,3);
im2 = quantize(im,2);
im1 = quantize(im,1);

subplot(242), imshow(im7), title('7-bit');
subplot(243), imshow(im6), title('6-bit');
subplot(244), imshow(im5), title('5-bit');
subplot(245), imshow(im4), title('4-bit');
subplot(246), imshow(im3), title('3-bit');
subplot(247), imshow(im2), title('2-bit');
subplot(248), imshow(im1), title('1-bit');

end