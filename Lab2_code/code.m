% ð?c ?nh 
i = imread('test1.jpg'); 
i = imresize(i,[250,250]); %kich thuoc anh -> 250x250 
% chuy?n ?nh nh? phân
i = rgb2gray(i); 
i = imbinarize(i); % chuy?n sang ?nh nh? phân
% ð?m và lýu runlength
pixels = i(:); 
compressed_data = []; 
current_pixel = pixels(1); 
count = 1; 
for k = 2:length(pixels) 
    if pixels(k) == current_pixel 
        count = count + 1; 
    else 
        compressed_data = [compressed_data; current_pixel, count]; 
        current_pixel = pixels(k); 
        count = 1; 
    end 
end 
% m? hóa và gi?i m?
compressed_data = [compressed_data; current_pixel, count]; 
compressed_size = sum(cellfun(@(x) numel(dec2bin(x)), num2cell(compressed_data(:,1))) + ... 
cellfun(@(x) numel(dec2bin(x)), num2cell(compressed_data(:,2)))); 
compression_ratio = 250 *250 / compressed_size; 
decoded_pixels = []; 
for k = 1:size(compressed_data, 1) 
    decoded_pixels = [decoded_pixels; 
    repmat(compressed_data(k,1), compressed_data(k,2), 1)]; 
end 
% Tao lai ma tran anh tu du lieu giai nen 
decoded_image = reshape(decoded_pixels, size(i)); 
figure 
imshowpair(i,decoded_image,'montage'); 
title(['anh goc -> anh nen. Ti le nen: ',num2str(compression_ratio)]);

