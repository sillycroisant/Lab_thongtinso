function str=matrixToString(matrix)
binaryString='';
matrix=char(matrix);
for i=1:size(matrix,1)
    for j=1:size(matrix,2)
        if(matrix(i,j)==0)
            binaryString=[binaryString,'0'];
        else
            binaryString=[binaryString,'1'];
        end
        
    end
end
str=binaryToString(binaryString);
end
