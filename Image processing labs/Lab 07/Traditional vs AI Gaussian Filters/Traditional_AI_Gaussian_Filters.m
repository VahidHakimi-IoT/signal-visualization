
%% Assignment: Gaussian Noise and Image Denoising
close all; clear; clc;

% 1) Load the original image
originalImage = im2double(imread('cameraman.tif'));

% 2) Add Gaussian noise
noiseSigma = 0.04;
noisyImage = imnoise(originalImage, 'gaussian', 0, noiseSigma^2);

% 3) Apply Mean filter
meanKernel = ones(5,5)/25;
meanFiltered = imfilter(noisyImage, meanKernel, 'replicate');

% 4) Apply Median filter
medianFiltered = medfilt2(noisyImage, [5 5]);

% 5) Apply Gaussian filter
gaussianFiltered = imgaussfilt(noisyImage, 1);

% 6) Display the images
figure('Name','Gaussian Noise Denoising Comparison');

subplot(2,3,1);
imshow(originalImage);
title('Original');

subplot(2,3,2);
imshow(noisyImage);
title('Gaussian Noise');

subplot(2,3,3);
imshow(meanFiltered);
title('Mean Filter');

subplot(2,3,4);
imshow(medianFiltered);
title('Median Filter');

subplot(2,3,5);
imshow(gaussianFiltered);
title('Gaussian Filter');

% 7) Calculate MSE, PSNR and SSIM

% Noisy image
mseNoisy = immse(noisyImage, originalImage);
psnrNoisy = psnr(noisyImage, originalImage);
ssimNoisy = ssim(noisyImage, originalImage);

% Mean filter
mseMean = immse(meanFiltered, originalImage);
psnrMean = psnr(meanFiltered, originalImage);
ssimMean = ssim(meanFiltered, originalImage);

% Median filter
mseMedian = immse(medianFiltered, originalImage);
psnrMedian = psnr(medianFiltered, originalImage);
ssimMedian = ssim(medianFiltered, originalImage);

% Gaussian filter
mseGaussian = immse(gaussianFiltered, originalImage);
psnrGaussian = psnr(gaussianFiltered, originalImage);
ssimGaussian = ssim(gaussianFiltered, originalImage);

% 8) Display the metrics
fprintf('\n--- Image Quality Metrics ---\n');
fprintf('Method | MSE | PSNR (dB) | SSIM\n');
fprintf('------------------------------------------------\n');

fprintf('Noisy    | %.6f | %.4f | %.4f\n', ...
    mseNoisy, psnrNoisy, ssimNoisy);

fprintf('Mean     | %.6f | %.4f | %.4f\n', ...
    mseMean, psnrMean, ssimMean);

fprintf('Median   | %.6f | %.4f | %.4f\n', ...
    mseMedian, psnrMedian, ssimMedian);

fprintf('Gaussian | %.6f | %.4f | %.4f\n', ...
    mseGaussian, psnrGaussian, ssimGaussian);
