function bai1c(name)

im = imread(name);

[imR, imG, imB] = divideLayer(im);

%Downsample
downscale = 10; %Vary this variable to change the sample-frequency
imdownR = downSample(imR, downscale);
imdownG = downSample(imG, downscale);
imdownB = downSample(imB, downscale);

out1(:,:,1) = imdownR;
out1(:,:,2) = imdownG;
out1(:,:,3) = imdownB;

figure;
subplot(121); imshow(im); title('color img');
subplot(122); imshow(out1); title('dowwnsampled img');

%Quantize
quantBit = 4; %Vary this variable to change the bits used to quantize img
quantimR = quantize(imR,quantBit);
quantimG = quantize(imG,quantBit);
quantimB = quantize(imB,quantBit);

out2(:,:,1) = quantimR;
out2(:,:,2) = quantimG;
out2(:,:,3) = quantimB;

figure;
subplot(121); imshow(im); title('color img');
subplot(122); imshow(out2); title('quantized img');

end


