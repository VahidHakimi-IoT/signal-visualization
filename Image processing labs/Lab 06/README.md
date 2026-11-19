# Lab 6: Mini Project – Image Processing Pipeline

## Objective

The aim of this mini-project was to combine different Digital Signal Processing (DSP) techniques to process an image using MATLAB. I wanted to see how filtering, contrast enhancement, edge detection and frequency-domain filtering can change an image.

## Processing Steps

First, I selected a building image and converted it into a grayscale image. Then, I applied a 3 × 3 median filter to reduce noise. This filter replaces each pixel with the median value of its neighbouring pixels, which helps reduce noise while keeping some important edges.

After that, I used the `imadjust` function to improve the contrast. This made the image details easier to see. Next, I applied the Canny edge detector to identify edges and boundaries, such as the shapes of the building and its windows.

Finally, I used the Fourier Transform to move the image into the frequency domain. I applied a low-pass filter to remove high-frequency components and then used the inverse Fourier Transform to return the image to the spatial domain.

## Results and Discussion

After processing, I could see the differences between the original image and the processed images. The median filter helped smooth the image, while contrast enhancement improved its appearance. The Canny method highlighted the edges and boundaries of the building.

The low-pass filter produced a smoother image by removing high-frequency components. However, it also removed some fine details and sharp edges. This shows that filtering can improve an image in some ways but can also affect important information.

## Conclusion

In this lab, I learned how different DSP techniques can be combined to process a digital image. I also understood better the difference between spatial-domain processing and frequency-domain processing. By using MATLAB, I could see how filtering, contrast enhancement, edge detection and Fourier Transform techniques work in practice.
