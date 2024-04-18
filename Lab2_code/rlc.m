clc; close all; clearvars;

name = 'TestRLC_resize_bmp.bmp';
im = imread(name);
im = rgb2gray(im);
%histogram(im);
T = 130;
im(im > T) = 255;
im(im <= T) = 0;

bw_im = char(zeros(size(im)));
bw_im(im == 255) = 'w';
bw_im(im == 0) = 'b';

figure;
imshow(im);

[row, col] = size(bw_im);

encode = [];

counter = 1;

for i=1:row
    for j=1:col-1
        if(bw_im(i,j) == bw_im(i,j+1))
            counter = counter + 1;
        else
            encode = [encode, num2str(counter), num2str(bw_im(i,j)),];
        counter = 1;
        end
    end
end


