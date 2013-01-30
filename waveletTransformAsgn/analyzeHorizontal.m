function [lowImage, highImage] = analyzeHorizontal(image)

% (1 + z^-1)/2 and (1 - z^-1)/2
[rows, columns] = size(image);

lowImg = zeros(size(image));
highImg = zeros(size(image));
for i = 1:rows
    if i == 1
        a = rows;
    else
        a = 0;
    end
    lowImg(i, :) = (image(i, :) + image(i-1+a, :))/2;
    highImg(i, :) = (image(i, :) - image(i-1+a, :))/2;
end

% downsample
lowImage = zeros([rows/2 columns]);
highImage = zeros([rows/2 columns]);

for i = 1:rows/2
    lowImage(i, :) = lowImg(2*i, :);
    highImage(i, :) = highImg(2*i, :);
end

end
