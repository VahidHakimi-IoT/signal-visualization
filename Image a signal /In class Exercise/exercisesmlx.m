
%% Exercise 1: Pixels and Quantization

% Load image
I = imread('cameraman.tif');

% Display image
imshow(I);
title('Original Image');

% Print image information
disp('Image size:');
disp(size(I));

disp('Image class:');
disp(class(I));

%% Quantization

% 4-bit quantization (16 gray levels)
Q4 = uint8(floor(double(I)/16)*16);

% 2-bit quantization (4 gray levels)
Q2 = uint8(floor(double(I)/64)*64);

% 1-bit quantization (2 gray levels)
Q1 = uint8(floor(double(I)/128)*128);

% Display results
montage({I,Q4,Q2,Q1});

title('Original, 4-bit, 2-bit and 1-bit Images');

%% Spatial Sampling

% Downsampling without imresize
A1 = I(1:8:end, 1:8:end);

% Downsampling with imresize
A2 = imresize(I, 1/8);

% Display results
montage({I,A1,A2});

title('Original, Direct Sampling and imresize');

%% Exercise 2 - Degrade an Image

% Add Gaussian noise
Ig = imnoise(I, 'gaussian', 0, 0.01);

% Add salt-and-pepper noise
Isp = imnoise(I, 'salt & pepper', 0.05);

% Display the original and noisy images
figure;
montage({I, Ig, Isp});
title('Original, Gaussian Noise and Salt-and-Pepper Noise');

% Create a motion blur filter
hMotion = fspecial('motion', 15, 30);

% Apply motion blur
Ib = imfilter(I, hMotion, 'replicate');

% Display the result
figure;
montage({I, Ib});
title('Original and Motion Blurred Image');

% Create a horizontal brightness ramp
[M, N] = size(I);
ramp = repmat(linspace(0.3, 1.0, N), M, 1);

% Multiply the original image by the ramp
Iramp = uint8(double(I) .* ramp);

% Display the result
figure;
montage({I, Iramp});
title('Original and Image with Brightness Ramp');

%% Exercise 3 - Contrast and Geometry

% Load the image
P = imread('pout.tif');

% Display the original image
figure;
imshow(P);
title('Original Pout Image');

% Display the image histogram
figure;
imhist(P);
title('Histogram of Original Image');

% Improve contrast automatically
P_adjust = imadjust(P);

% Gamma correction
P_g05 = imadjust(P, [], [], 0.5);
P_g2 = imadjust(P, [], [], 2);

% Histogram equalization
P_histeq = histeq(P);

% Compare all results
figure;
montage({P, P_adjust, P_g05, P_g2, P_histeq});
title('Original, Contrast Adjustment, Gamma 0.5, Gamma 2 and Histogram Equalization');

% Select a 40x40 region from the center of the image
r0 = floor(size(P,1)/2) - 19;
c0 = floor(size(P,2)/2) - 19;
patch = P(r0:r0+39, c0:c0+39);

% Enlarge the region by a factor of 8
nearest = imresize(patch, 8, 'nearest');
bicubic = imresize(patch, 8, 'bicubic');

% Display the results
figure;
montage({patch, nearest, bicubic});
title('Original Patch, Nearest Neighbor and Bicubic');

%% Exercise 4 - Filter and Compare

% Create mean and Gaussian filters
hMean = fspecial('average', [3 3]);
hGauss = fspecial('gaussian', [3 3], 0.5);

% Filter Gaussian-noise image
Ig_mean = imfilter(Ig, hMean, 'replicate');
Ig_gauss = imfilter(Ig, hGauss, 'replicate');
Ig_median = medfilt2(Ig, [3 3]);

% Filter salt-and-pepper image
Isp_mean = imfilter(Isp, hMean, 'replicate');
Isp_gauss = imfilter(Isp, hGauss, 'replicate');
Isp_median = medfilt2(Isp, [3 3]);

% Display results for Gaussian noise
figure;
montage({Ig, Ig_mean, Ig_gauss, Ig_median});
title('Gaussian Noise: Original Noise, Mean, Gaussian and Median Filters');

% Display results for salt-and-pepper noise
figure;
montage({Isp, Isp_mean, Isp_gauss, Isp_median});
title('Salt-and-Pepper Noise: Original Noise, Mean, Gaussian and Median Filters');

% Calculate PSNR values
noiseNames = ["Gaussian"; "Salt-and-pepper"];

MeanPSNR = [
    psnr(Ig_mean, I);
    psnr(Isp_mean, I)
    ];

GaussianPSNR = [
    psnr(Ig_gauss, I);
    psnr(Isp_gauss, I)
    ];

MedianPSNR = [
    psnr(Ig_median, I);
    psnr(Isp_median, I)
    ];

% Create and display comparison table
T = table(noiseNames, MeanPSNR, GaussianPSNR, MedianPSNR);
disp(T);

% Fourier transform of original image
F_original = fftshift(fft2(double(I)));

% Fourier transform of motion-blurred image
F_blurred = fftshift(fft2(double(Ib)));

% Calculate log magnitude spectra
S_original = log(1 + abs(F_original));
S_blurred = log(1 + abs(F_blurred));

% Display spectra
figure;
subplot(1,2,1);
imshow(S_original, []);
title('Original Image Spectrum');

subplot(1,2,2);
imshow(S_blurred, []);
title('Motion-Blurred Image Spectrum');

%% Exercise 5 - Edge Detection

% Apply Sobel edge detection
BW_sobel = edge(I, 'sobel');

% Apply Canny edge detection
BW_canny = edge(I, 'canny');

% Display results
figure;
montage({I, BW_sobel, BW_canny});
title('Original, Sobel and Canny Edge Detection');

% Apply Canny with different sigma values
BW_sigma1 = edge(I, 'canny', [], 1);
BW_sigma2 = edge(I, 'canny', [], 2);
BW_sigma3 = edge(I, 'canny', [], 3);

% Display results
figure;
montage({BW_sigma1, BW_sigma2, BW_sigma3});
title('Canny Edge Detection: Sigma 1, 2 and 3');

% Detect edges directly in the noisy image
BW_noisy = edge(Ig, 'canny');

% Smooth the noisy image before edge detection
Ig_smooth = imgaussfilt(Ig, 1);
BW_smooth = edge(Ig_smooth, 'canny');

% Detect edges in the clean original for comparison
BW_clean = edge(I, 'canny');

% Count edge pixels
count_noisy = nnz(BW_noisy);
count_smooth = nnz(BW_smooth);
count_clean = nnz(BW_clean);

% Count false-positive edge pixels relative to clean image
false_before = nnz(BW_noisy & ~BW_clean);
false_after = nnz(BW_smooth & ~BW_clean);

% Calculate the number of false edges removed
false_removed = false_before - false_after;

% Display results
figure;
montage({Ig, BW_noisy, Ig_smooth, BW_smooth});
title('Noisy Image, Edges Before and After Smoothing');

fprintf('Clean edge pixels: %d\n', count_clean);
fprintf('Noisy edge pixels: %d\n', count_noisy);
fprintf('Smoothed edge pixels: %d\n', count_smooth);
fprintf('False edges before smoothing: %d\n', false_before);
fprintf('False edges after smoothing: %d\n', false_after);
fprintf('False edges removed: %d\n', false_removed);

%% Exercise 6 - Segment and Measure

% Load the coins image
Icoins = imread('coins.png');

% Convert to grayscale if necessary
if size(Icoins, 3) == 3
    Icoins = rgb2gray(Icoins);
end

% Calculate Otsu threshold
level = graythresh(Icoins);

% Convert image to binary
BW = imbinarize(Icoins, level);

% Display original and binary images
figure;
montage({Icoins, BW});
title('Original Coins Image and Otsu Segmentation');

% Create a disk-shaped structuring element
se = strel('disk', 3);

% Remove small protrusions and objects
BW_open = imopen(BW, se);

% Fill holes inside the coins
BW_fill = imfill(BW_open, 'holes');

% Remove small connected components
BW_clean = bwareaopen(BW_fill, 50);

% Display each cleaning stage
figure;
montage({BW, BW_open, BW_fill, BW_clean});
title('Original Binary, Opening, Hole Filling and Cleaned Image');

% Label connected components
[L, num] = bwlabel(BW_clean);

% Measure the area of each component
stats = regionprops(L, 'Area', 'Centroid');

% Extract areas
areas = [stats.Area]';

% Display the number of detected objects
fprintf('Number of detected coins: %d\n', num);

% Create a table of coin areas
CoinNumber = (1:num)';
T_coins = table(CoinNumber, areas, ...
    'VariableNames', {'CoinNumber', 'AreaPixels'});

disp(T_coins);

% Find the largest detected coin
[largestArea, largestIndex] = max(areas);

fprintf('Largest coin: %d\n', largestIndex);
fprintf('Largest area: %.0f pixels\n', largestArea);

% Display labeled image
figure;
imshow(label2rgb(L, 'jet', 'k', 'shuffle'));
title('Labeled Coins');












