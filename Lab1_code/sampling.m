function [out] = sampling(gray_img, scale)
[col, row] = size(gray_img);
downSampledImg = gray_img(1:scale:end,1:scale:end);

for i=1:col
    for j=1:row
        tmp(i,j) = downSampledImg(ceil(i/scale),ceil(j/scale));
    end
end
out = tmp;
end
