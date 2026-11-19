
%%\ Lab 6: Mini Project - Your Image Pipeline
close all; clear; clc;

% 1) Load your own image
I_rgb = imread('building.jpg');
I = im2double(rgb2gray(I_rgb));

% 2) Pre-process: noise removal
I_filt = medfilt2(I,[3 3]);

% 3) Enhance contrast
I_enh = imadjust(I_filt,[0.2 0.8],[0 1]);

% 4) Extract edges using Canny
edges = edge(I_enh,'Canny',[0.1 0.25]);

% 5) Frequency-domain low-pass filtering
F = fftshift(fft2(I_enh));

[M,N] = size(F);

[X,Y] = meshgrid(1:N,1:M);
D = sqrt((X-N/2).^2 + (Y-M/2).^2);

H = double(D < 60);

F_filtered = F .* H;

I_lp = real(ifft2(ifftshift(F_filtered)));

% 6) Visualization
figure;
montage({I,I_filt,I_enh,edges,I_lp},'Size',[1 5]);

title('Original | Denoised | Enhanced | Edges | LP result');

% 7) Display each image separately with labels
figure;

subplot(2,3,1);
imshow(I);
title('Original');

subplot(2,3,2);
imshow(I_filt);
title('Median Filter');

subplot(2,3,3);
imshow(I_enh);
title('Contrast Enhanced');

subplot(2,3,4);
imshow(edges);
title('Canny Edges');

subplot(2,3,5);
imshow(I_lp,[]);
title('Low-Pass Filter');


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
