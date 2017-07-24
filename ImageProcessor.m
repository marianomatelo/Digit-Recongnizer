function I = ImageProcessor(rgb)
gray = rgb2gray(rgb);
bw = ~im2bw(gray);
for i = 1:size(bw,1)
    if sum(bw(i,:)) > 0
        startRow = i-2;
        break;
    end
end
for i = size(bw,1):-1:1
    if sum(bw(i,:)) > 0
        stopRow = i+2;
        break;
    end
end
for i = 1:size(bw,2)
    if sum(bw(:,i)) > 0
        startCol = i-2;
        break;
    end
end
for i = size(bw,2):-1:1
    if sum(bw(:,i)) > 0
        stopCol = i+2;
        break;
    end
end
I = bw(startRow:stopRow,startCol:stopCol);
I  = imresize(I,[70 50]);
