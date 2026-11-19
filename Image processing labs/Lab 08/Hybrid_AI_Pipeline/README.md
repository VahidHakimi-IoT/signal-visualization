# Hybrid Traditional + AI Image Processing Pipeline

## 1. Objective

The aim of this assignment was to combine traditional image processing techniques with Artificial Intelligence (AI) for image classification. I used K-Means color segmentation to separate image regions and a pre-trained CNN (SqueezeNet) to classify the images.

## 2. Load Image and AI Network

First, I loaded the sample image `peppers.png` into MATLAB. I also loaded the pre-trained SqueezeNet neural network. SqueezeNet is a CNN used for image classification.

## 3. Traditional Method: K-Means Segmentation

I used K-Means clustering to divide the image into two color clusters. First, I converted the image into Lab color space and used its color channels for clustering. Then, I created a mask to separate one cluster from the rest of the image.

The segmentation separated parts of the peppers from the background, but it did not perfectly isolate the objects.

## 4. AI Method: Image Classification

I used the pre-trained SqueezeNet network to classify both the original image and the segmented image. Before classification, both images were resized to the input size required by the network.

The AI model returned a predicted class and confidence score for each image.

## 5. Results Analysis

The classification results were:

| Input | Predicted Class | Confidence |
|---|---|---:|
| Original Image | Bell pepper | 41.72% |
| Segmented Image | Sea slug | 32.84% |

The original image was classified as a bell pepper with 41.72% confidence. After segmentation, the predicted class changed to sea slug, with 32.84% confidence.

In this experiment, segmentation did not improve the classification result. The segmentation mask may have removed or changed important image information, which affected the AI model's prediction.

## 6. Screenshots

### Hybrid Pipeline Figure

The figure shows the original image, K-Means mask, segmented image, AI inputs and classification confidence comparison.

![Hybrid Pipeline Figure](screenshots/01_pipeline_figure.png)

### MATLAB Command Window Results

The Command Window shows the predicted classes and confidence values for the original and segmented images.

![MATLAB Results](screenshots/02_results_command_window.png)

## 7. Conclusion

In this assignment, I learned how traditional image processing and AI can be combined in a computer vision pipeline. K-Means was used for color segmentation, while SqueezeNet was used for image classification.

The results showed that segmentation does not always improve classification. The quality of the segmented image can affect the AI model's prediction. This helped me understand the limitations of combining traditional image processing with AI.

