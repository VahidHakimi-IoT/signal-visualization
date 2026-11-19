# Gaussian Noise Removal and Filter Comparison

## 1. Objective

The aim of this assignment was to add Gaussian noise to a digital image and compare different filtering methods for noise reduction. I also used MSE, PSNR and SSIM to evaluate the quality of the processed images and compare the results.

## 2. Adding Gaussian Noise

First, I loaded the Cameraman image in MATLAB and converted it into double format. Then, I added Gaussian noise using the `imnoise` function.

The noise standard deviation was set to 0.04, and the noise mean was set to 0.

Gaussian noise introduces random changes to pixel values, which makes the image look noisy and reduces its visual quality.

## 3. Filtering Methods

I applied three different filtering methods to the noisy image.

### Mean Filter

The Mean filter calculates the average value of neighbouring pixels. It can reduce noise, but it may also blur edges and remove fine details.

### Median Filter

The Median filter replaces each pixel with the median value of its neighbouring pixels. It can reduce noise and preserve edges better than a simple averaging filter in some situations.

### Gaussian Filter

The Gaussian filter uses weighted averaging to smooth the image. Pixels closer to the centre receive higher weights. In my experiment, this filter produced the best SSIM result.

## 4. Image Quality Metrics

I used three metrics to evaluate the image quality.

- **MSE (Mean-Square Error):** Measures the average squared difference between the original and processed images. A lower value is better.
- **PSNR (Peak Signal-to-Noise Ratio):** Measures the image quality in decibels. A higher value is generally better.
- **SSIM (Structural Similarity Index):** Compares the structural similarity between two images. A value closer to 1 indicates better structural similarity.

## 5. Results

The following table shows the results from my MATLAB experiment.

| Method | MSE | PSNR (dB) | SSIM |
|---|---:|---:|---:|
| Noisy Image | 0.001536 | 28.1354 | 0.6319 |
| Mean Filter | 0.005019 | 22.9940 | 0.7183 |
| Median Filter | 0.004281 | 23.6845 | 0.7339 |
| Gaussian Filter | 0.002539 | 25.9530 | 0.8123 |

### Results Interpretation

The noisy image had the lowest MSE and the highest PSNR in this experiment. This means that the filtered images had more pixel-level error compared with the original image than the noisy image did.

However, all three filters improved the SSIM value. The Gaussian filter achieved the highest SSIM of 0.8123, compared with 0.6319 for the noisy image.

The Median filter performed better than the Mean filter in both MSE, PSNR and SSIM. The Gaussian filter achieved the best SSIM result, which suggests that it improved the structural similarity of the image.

These results show that noise reduction can also change image details. Different quality metrics can give different results, so it is important to consider both numerical measurements and visual observations.

## 6. MATLAB Screenshots

### Image Comparison

Add your MATLAB figure screenshot here.

![Image comparison](screenshots/image_comparison.png)

### Image Quality Metrics

Add your MATLAB Command Window screenshot here.

![Image quality metrics](screenshots/metrics.png)

## 7. Conclusion

In this assignment, I learned how Gaussian noise can be added to a digital image and how different filters can reduce it. I applied Mean, Median and Gaussian filters and compared their results using MSE, PSNR and SSIM.

The Gaussian filter achieved the highest SSIM in my experiment. However, the noisy image had lower MSE and higher PSNR values. This helped me understand that image filtering can improve some aspects of image quality while affecting other details.

I also learned that image quality cannot always be evaluated using only one metric. Both numerical measurements and visual observations are important when comparing image processing methods.
