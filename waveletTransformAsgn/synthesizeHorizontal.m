function image = synthesizeHorizontal(lowImage, highImage)

% upsample
[rows, columns] = size(lowImage);
lowImg = zeros([rows * 2, columns]);
highImg = zeros([rows * 2, columns]);

for i = 1:rows
    lowImg(2*i, :) = lowImage(i, :);
    highImg(2*i, :) = highImage(i, :);
end

% join
[rows, columns] = size(lowImg);
image = zeros(size(lowImg));
for i = 1:rows
    if i == 1
        a = rows;
    else
        a = 0;
    end
    image(i, :) = lowImg(i, :) + lowImg(i-1+a, :) + highImg(i, :) - highImg(i-1+a, :);
end
