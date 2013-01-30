function [lowImage, highImage] = analyzeVertical(image)

% (1 + z^-1)/2 and (1 - z^-1)/2
[rows, columns] = size(image);

lowImg = zeros(size(image));
highImg = zeros(size(image));
for j = 1:columns
    if j == 1
        a = columns;
    else
        a = 0;
    end
    lowImg(:, j) = (image(:, j) + image(:, j-1+a))/2;
    highImg(:, j) = (image(:, j) - image(:, j-1+a))/2;
end

% downsample
lowImage = zeros([rows columns/2]);
highImage = zeros([rows columns/2]);

for j = 1:columns/2
    lowImage(:, j) = lowImg(:, 2*j);
    highImage(:, j) = highImg(:, 2*j);
end

end