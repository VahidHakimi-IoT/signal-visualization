# Tire Stud Detector

## Description
This project uses MATLAB image processing techniques to detect and count possible metal studs in tire images. It classifies tires as either **STUDDED TIRE** or **NON-STUDDED TIRE**.

## Files
- `tire_stud_detector.m` – MATLAB detection script.
- `studded_tire.jpeg` – Studded winter tire image.
- `summer_tire.jpg` – Non-studded summer tire image.

## Image Processing Steps
1. Read and resize the images.
2. Convert images to grayscale.
3. Create a mask to isolate the tire.
4. Detect bright spots inside the tire.
5. Remove noise using morphological operations.
6. Detect and measure connected components using `regionprops`.
7. Count possible studs and classify the tires.
8. Display the original image, candidate mask, and final detection results.

## Results

| Image | Detected Studs | Classification |
|---|---:|---|
| studded_tire.jpeg | 37 | STUDDED TIRE |
| summer_tire.jpg | 9 | NON-STUDDED TIRE |

## Requirements
- MATLAB
- Image Processing Toolbox

## How to Run
1. Download or clone this repository.
2. Place all three files in the same folder.
3. Open MATLAB and navigate to the project folder.
4. Run `tire_stud_detector.m`.

## Author
MATLAB Image Processing Assignment
