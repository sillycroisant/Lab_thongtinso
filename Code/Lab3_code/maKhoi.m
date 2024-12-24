H=[1 0 1 1 1 0 0
   1 1 0 1 0 1 0
   1 1 1 0 0 0 1];
G=[ 1 0 0 0 1 1 1
    0 1 0 0 0 1 1
    0 0 1 0 1 0 1
    0 0 0 1 1 1 0];
e={ [0 0 0 0 0 0 0]
    [1 0 0 0 0 0 0]
    [0 1 0 0 0 0 0]
    [0 0 1 0 0 0 0]
    [0 0 0 1 0 0 0]
    [0 0 0 0 1 0 0]
    [0 0 0 0 0 1 0]
    [0 0 0 0 0 0 1]};
mSyn=size(e,1);

%tạo mã syndrone từ ma trận lỗi vector
for i=1:mSyn
    syndrone{i}=e{i}*H';
end

% tạo ma trận syndrone
for i=1:size(syndrone,2)-1
    syns(i,:)=syndrone{1,i+1};
end
% Ví dụ sử dụng:
inputString = 'HOAN HOANG HUNG HUY PHAT';
binaryMatrix = convertToBinaryMatrix(inputString,4); %chuyển đổi kí tự chuyển đi thành ma trận
disp(inputString);

% m là ma tin cần chuyển đi
m=binaryMatrix;
xm=size(m,1);
% c là tin phát
c=m(1:xm,:)*G;
c=mod(c,2);             %truyền đi với mã khối (4,7)
disp(c);
% r là tin thu, bị sai khác một số vị trí
c(1,1)=c(1,1)+1;
c(2,1)=c(2,1)+1;
c(11,1)=c(11,1)+1;
c(12,1)=c(12,1)+1;
c(23,1)=c(23,1)+1;
c(24,1)=c(24,1)+1;
c(33,1)=c(33,1)+1;
c(34,1)=c(34,1)+1;
c(41,1)=c(41,1)+1;
c(42,1)=c(42,1)+1;

r=mod(c,2);
disp(r);
% kiểm tra và sửa lỗi
for i=1:size(r,1)
    s=r(i,:)*syns;
    s=mod(s,2);
    for j=1:size(e)
        if (s==syndrone{1,j})
            r(i,:)=r(i,:)+e{j,1};
            r(i,:)=mod(r(i,:),2);
            break
        end
    end
end

%loại bỏ CRC
dulieu=r(:,1:4);


% Hiển thị ma trận 4 cột
str=matrixToString(dulieu);
disp(str);