function image = synthesizeVertical(lowImage, highImage)

% upsample
[rows, columns] = size(lowImage);
lowImg = zeros([rows, columns *2]);
highImg = zeros([rows, columns *2]);

for j = 1:columns
    lowImg(:, 2*j) = lowImage(:, j);
    highImg(:, 2*j) = highImage(:, j);
end

% join
[rows, columns] = size(lowImg);
image = zeros(size(lowImg));
for j = 1:columns
    if j == 1
        a = columns;
    else
        a = 0;
    end
    image(:, j) = lowImg(:, j) + lowImg(:, j-1+a) + highImg(:, j) - highImg(:, j-1+a);
end
