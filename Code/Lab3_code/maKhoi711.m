H=[0 0 1 1 1 0 1 1 0 0 0
   0 1 1 0 1 1 0 0 1 0 0
   1 0 1 0 0 1 1 0 0 1 0
   1 1 0 1 0 0 1 0 0 0 1];
G=[ 1 0 0 0 0 0 0 0 0 1 1
    0 1 0 0 0 0 0 0 1 0 1
    0 0 1 0 0 0 0 1 1 1 0
    0 0 0 1 0 0 0 1 0 0 1
    0 0 0 0 1 0 0 1 1 0 0
    0 0 0 0 0 1 0 0 1 1 0
    0 0 0 0 0 0 1 1 0 1 1];
e={ [0 0 0 0 0 0 0 0 0 0 0]
    [1 0 0 0 0 0 0 0 0 0 0]
    [0 1 0 0 0 0 0 0 0 0 0]
    [0 0 1 0 0 0 0 0 0 0 0]
    [0 0 0 1 0 0 0 0 0 0 0]
    [0 0 0 0 1 0 0 0 0 0 0]
    [0 0 0 0 0 1 0 0 0 0 0]
    [0 0 0 0 0 0 1 0 0 0 0]
    [0 0 0 0 0 0 0 1 0 0 0]
    [0 0 0 0 0 0 0 0 1 0 0]
    [0 0 0 0 0 0 0 0 0 1 0]
    [0 0 0 0 0 0 0 0 0 0 1]
    [0 1 0 0 0 0 0 0 0 1 0]
    [1 0 0 1 0 0 0 0 0 0 0]
    [1 0 1 0 0 0 0 0 0 0 0]
    [1 0 0 0 1 0 0 0 0 0 0]};
mSyn=size(e,1);

%tạo mã syndrone từ ma trận lỗi vector
for i=1:mSyn
    syndrone{i}=e{i}*H';
end

% tạo ma trận syndrone
for i=1:size(syndrone,2)
    syns(i,:)=syndrone{1,i};
end
syns=mod(syns,2);


% Ví dụ sử dụng:
inputString = 'HOAN HOANG HUNG HUY PHAT';
binaryMatrix = convertToBinaryMatrix(inputString,7); %chuyển đổi kí tự chuyển đi thành ma trận
disp(inputString);

% m là ma tin cần chuyển đi
m=binaryMatrix;
xm=size(m,1);
% c là tin phát
c=m(1:xm,:)*G;
c=mod(c,2);             %truyền đi với mã khối (4,7)
% r là tin thu, bị sai khác một số vị trí
c(1,1)=c(1,1)+1;
c(1,6)=c(1,6)+1;
c(6,1)=c(6,1)+1;
c(6,6)=c(6,6)+1;
c(12,1)=c(12,1)+1;
c(12,6)=c(12,6)+1;
c(17,1)=c(17,1)+1;
c(17,6)=c(17,6)+1;
c(21,1)=c(21,1)+1;
c(21,6)=c(21,6)+1;


r=mod(c,2);

% kiểm tra và sửa lỗi
for i=1:size(r,1)
    s=r(i,:)*H';
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
dulieu=r(:,1:7);


% Hiển thị ma trận 4 cột
str=matrixToString(dulieu);
disp(str);