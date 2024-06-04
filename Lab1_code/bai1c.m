im = imread('img1.jpg');

[imR, imG, imB] = divideLayer(im);

%Downsample
downscale = 2; %Vary this variable to change the sample-frequency
imdownR = sampling(imR, downscale);
imdownG = sampling(imG, downscale);
imdownB = sampling(imB, downscale);

figure;
subplot(121); imshow(im), title('original img');

%Quantize
quantBit = 3; %Vary this variable to change the bits used to quantize img
quantimR = quantize(imdownR,quantBit);
quantimG = quantize(imdownG,quantBit);
quantimB = quantize(imdownB,quantBit);

out(:,:,1) = quantimR;
out(:,:,2) = quantimG;
out(:,:,3) = quantimB;

subplot(122); imshow(out); title('after got sampled and quantized');