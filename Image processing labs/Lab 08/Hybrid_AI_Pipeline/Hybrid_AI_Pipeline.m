%% Assignment: Hybrid Traditional + AI Pipeline
close all; clear; clc;

% ---------------------------------------------------
% Section 1: Load Image and AI Network
% ---------------------------------------------------

% Load a sample image
targetImage = imread('peppers.png');

% Load pre-trained SqueezeNet network
disp('Loading pre-trained AI network (SqueezeNet)...');
net = squeezenet;
disp('Network loaded.');

figure('Name', 'Hybrid Traditional + AI Pipeline');

subplot(2,3,1);
imshow(targetImage);
title('Original Image');

% ---------------------------------------------------
% Section 2: Traditional Method (K-Means Segmentation)
% ---------------------------------------------------

disp('Applying traditional color segmentation (K-Means)...');

% Convert image to Lab color space
imgLab = rgb2lab(targetImage);

% Extract color information (a and b channels)
ab = imgLab(:,:,2:3);
ab = im2single(ab);

% Segment the image into 2 clusters
pixelLabels = imsegkmeans(ab, 2);

% Create a mask for Cluster 2
mask = pixelLabels == 2;

% Apply mask to the original image
isolatedObject = targetImage;
isolatedObject(repmat(~mask, 1, 1, 3)) = 0;

subplot(2,3,2);
imshow(mask);
title('K-Means Mask');

subplot(2,3,3);
imshow(isolatedObject);
title('Segmented Image');

% ---------------------------------------------------
% Section 3: AI Method (Image Classification)
% ---------------------------------------------------

disp('Running AI classification...');

% Get the input size of SqueezeNet
inputSize = net.Layers(1).InputSize;

% Resize the original image
resizedOriginal = imresize(targetImage, ...
    [inputSize(1) inputSize(2)]);

% Classify the original image
[originalPrediction, originalProbs] = classify(net, resizedOriginal);

% Resize the segmented image
resizedObject = imresize(isolatedObject, ...
    [inputSize(1) inputSize(2)]);

% Classify the segmented image
[segmentedPrediction, segmentedProbs] = classify(net, resizedObject);

subplot(2,3,4);
imshow(resizedObject);
title('AI Input (Segmented)');

subplot(2,3,5);
imshow(resizedOriginal);
title('AI Input (Original)');

% ---------------------------------------------------
% Section 4: Results Analysis
% ---------------------------------------------------

subplot(2,3,6);
bar([max(originalProbs), max(segmentedProbs)] * 100);
xticklabels({'Original','Segmented'});
ylabel('Confidence (%)');
title('Classification Confidence');
ylim([0 100]);

fprintf('\n--- Hybrid Pipeline Results ---\n');

fprintf('Original image classification: %s\n', ...
    string(originalPrediction));

fprintf('Original confidence: %.2f%%\n', ...
    max(originalProbs)*100);

fprintf('\nSegmented image classification: %s\n', ...
    string(segmentedPrediction));

fprintf('Segmented confidence: %.2f%%\n', ...
    max(segmentedProbs)*100);