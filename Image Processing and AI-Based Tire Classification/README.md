Studded Tire Detection – Robustness Study
1. Project Overview
This project investigates computer vision methods for detecting studded and non-studded tires in roadside camera images.
Two classification approaches were compared:
Classical machine learning using HOG features and an SVM classifier.
A pretrained YOLO11n-cls model.
The study also evaluates performance under motion blur, low-light conditions and combined image degradation.
2. Dataset
The dataset contains images divided into:
st: Studded tires
nst: Non-studded tires
The dataset is split into training, validation and test sets.
Original images and the pretrained model were not modified.
3. Methods
Classical image processing
Grayscale conversion
CLAHE contrast enhancement
Gaussian filtering
Thresholding
Canny edge detection
Morphological operations
Connected-component analysis
Classical classifier
HOG image features and blob statistics were extracted and used to train an SVM classifier.
YOLO classifier
The provided pretrained YOLO11n-cls model was evaluated without retraining or modification.
Robustness experiments
The study included:
Horizontal motion blur with kernel lengths 5, 15, 25 and 35.
Low-light conditions with different gamma and noise settings.
Combined blur and low-light degradation.
Wiener filtering for motion-blur restoration.
Gamma correction and CLAHE for low-light correction.
Hybrid CLAHE and Wiener preprocessing.
4. Original Test Results
Classifier	Accuracy	Precision	Recall	F1
SVM	0.662	0.658	0.676	0.667
YOLO	0.905	0.841	1.000	0.914
YOLO performed better than SVM on the original test set.
5. Motion Blur Results
Blur length	SVM accuracy	YOLO accuracy
5	0.676	0.905
15	0.581	0.703
25	0.554	0.635
35	0.500	0.581
Both classifiers became less accurate as motion blur increased.
![Accuracy versus blur](report/figures/accuracy_vs_blur.png)
6. Low-Light and Combined Results
Condition	SVM accuracy	YOLO accuracy
Gamma 1.5, noise 5	0.689	0.878
Gamma 1.5, noise 15	0.662	0.838
Gamma 2.5, noise 5	0.622	0.838
Gamma 2.5, noise 15	0.649	0.797
Combined blur and low light	0.595	0.662
Combined degradation caused a substantial reduction in performance.
7. Restoration Results
Classifier	Original accuracy	Wiener-restored accuracy
SVM	0.662	0.608
YOLO	0.905	0.851
Hybrid CLAHE and Wiener preprocessing achieved:
Accuracy: 0.838
Precision: 0.931
Recall: 0.730
F1: 0.818
Restoration and preprocessing did not improve overall accuracy in these experiments.
Low-light restoration produced PSNR of 16.235 dB and SSIM of 0.707 for the example image tested.
8. Bootstrap Confidence Intervals
A bootstrap analysis with 1,000 resamples was used to estimate 95% confidence intervals.
Condition	Classifier	Accuracy	95% CI
Original	SVM	0.662	0.554–0.770
Original	YOLO	0.905	0.838–0.960
Blur L15	SVM	0.581	0.459–0.703
Blur L15	YOLO	0.703	0.608–0.811
Wiener restored	SVM	0.608	0.486–0.730
Wiener restored	YOLO	0.851	0.757–0.932
9. Conclusion
YOLO was the stronger classifier in the experiments. However, its performance declined under severe blur and combined low-light degradation.
The Wiener and hybrid preprocessing experiments did not improve overall classification accuracy.
YOLO is the more promising approach for further development, but human verification and additional testing are recommended before roadside enforcement.
10. Reproducibility
Random seed: 42
Environment: Google Colab
Main libraries: OpenCV, scikit-image, scikit-learn, Ultralytics, NumPy and Matplotlib.
The pretrained model was used without retraining or modification.
11. Project Structure
data/original: Original dataset
data/blur: Motion-blurred images
data/lowlight: Low-light images
data/restored: Restored images
part1_results: Classical image-processing examples
part6_results: Robustness plots
report/tables: Evaluation tables
report/figures: Report figures
