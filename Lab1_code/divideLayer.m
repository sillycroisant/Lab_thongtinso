function [imR, imG, imB] = divideLayer(color_img)
imR = color_img(:,:,1);
imG = color_img(:,:,2);
imB = color_img(:,:,3);
end