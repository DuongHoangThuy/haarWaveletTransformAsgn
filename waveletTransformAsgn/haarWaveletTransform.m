clear all; close all;
cd ~/Desktop/waveletTransformAsgn/;

image = imread('sunflower.jpg');
imgGray = mat2gray(rgb2gray(image));

%% analysis


[lowV, highV] = analyzeVertical(imgGray);
[lowVLowH, lowVHighH] = analyzeHorizontal(lowV);
[highVLowH, highVHighH] = analyzeHorizontal(highV);
% figure(100); imshow(lowVLowH);
% figure(200); imshow(lowVHighH);
% figure(300); imshow(highVLowH);
% figure(400); imshow(highVHighH);

%% synthesis

sLowV = synthesizeHorizontal(lowVLowH, lowVHighH);
sHighV = synthesizeHorizontal(highVLowH, highVHighH);
% figure(500); imshow(sLowV);
% figure(600); imshow(sHighV);
sImg = synthesizeVertical(sLowV, sHighV);
figure(700); imshow(sImg);