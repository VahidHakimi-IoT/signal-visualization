# Lab 1 – Image as a 2D Signal

## Introduction

In this lab, I explored how digital images work as 2D signals using MATLAB. The main goal was to understand how images are represented, how pixel values can be changed, and how image quality is affected by different image-processing techniques.

I worked with an image and performed several operations, including quantization, histogram analysis, contrast stretching, gamma correction, and image sampling.

## 1. Loading and Inspecting an Image

First, I loaded an image into MATLAB and displayed it in its original color format. After that, I converted it into grayscale.

This helped me understand how an RGB image can be represented using intensity values instead of three color channels.

**Observation:** The grayscale image keeps the main details of the original image but removes the color information.

## 2. Quantization and Dynamic Range

In this section, I compared images with different bit depths:

- 8-bit: 256 intensity levels.
- 6-bit: 64 intensity levels.
- 4-bit: 16 intensity levels.

I noticed that the 8-bit image looked smoother, while the 6-bit and 4-bit images showed more visible changes in brightness.

**What I learned:** Reducing the bit depth means reducing the number of available intensity levels. This can cause banding and posterization, especially in areas where brightness changes gradually.

## 3. Histogram and Contrast Stretching

Next, I used histograms to examine how pixel intensities were distributed in the image.

I also applied normalization and contrast stretching to improve the image appearance.

**Observation:** Contrast stretching made the image details easier to see by increasing the difference between darker and brighter areas. The histogram also showed a wider distribution of intensity values.

## 4. Gamma Correction

In this section, I applied two different gamma values:

- Gamma = 0.6
- Gamma = 1.6

The results were compared with the original image.

**Observation:** Gamma 0.6 made the image brighter, while gamma 1.6 made it darker.

**What I learned:** Gamma correction changes image brightness through a nonlinear transformation. It is different from contrast stretching because it does not simply apply a linear intensity adjustment.

## 5. Sampling and Aliasing

For the final experiment, I reduced the image size to 10% of its original dimensions using nearest-neighbor interpolation. Then, I enlarged it back to its original size.

**Observation:** The downsampled image lost many details. When enlarged again, it looked pixelated and less clear than the original.

**What I learned:** Reducing image resolution means losing spatial information. If the sampling frequency is too low, aliasing can occur. According to the Nyquist theorem, the sampling frequency should be at least twice the highest frequency present in the signal to avoid aliasing.

## 6. What I Learned from This Lab

This lab helped me understand some important concepts in digital image processing:

- Bit depth controls the number of intensity levels an image can represent.
- Dynamic range affects the range of brightness values.
- Histograms help us understand the distribution of image intensities.
- Contrast stretching improves the visibility of image details.
- Gamma correction changes brightness using a nonlinear transformation.
- Sampling controls image resolution, and aggressive downsampling can cause aliasing.

Overall, I learned how different image-processing operations affect image quality and why sampling and quantization are important when working with digital images.

## Screenshots and Results

The screenshots from each experiment are included in the `screenshots` folder.

| Screenshot | Description |
|---|---|
| 01_original.png | Original color image |
| 02_grayscale.png | Grayscale image |
| 03_quantization.png | Comparison of 8-bit, 6-bit, and 4-bit images |
| 04_histogram.png | Original and stretched histograms |
| 05_gamma.png | Gamma correction results |
| 06_sampling.png | Original, downsampled, and upscaled images |

## Tools Used

- MATLAB
- Image Processing Toolbox
- GitHub
- ChatGPT
---

**Conclusion:** This lab gave me practical experience with basic digital image processing. By testing each technique in MATLAB and comparing the results visually, I gained a better understanding of how digital images are sampled, quantized, and enhanced.
