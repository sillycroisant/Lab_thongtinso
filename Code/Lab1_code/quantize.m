function [out] = quantize(gray_img, scale)
%Take in a grayscale img and the number of bits using to quantize the img
gray_img = double(gray_img);
quantizeBit = double(2^(8 - scale));
out = uint8(floor(gray_img/quantizeBit)*quantizeBit);
end