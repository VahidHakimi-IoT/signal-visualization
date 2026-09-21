# Lecture 02 – Sampling and Aliasing

## Objective

The purpose of this investigation is to study how sampling frequency affects the digital representation of an analog signal. A 10 Hz sine wave was generated and sampled at 15 Hz, 20 Hz, 25 Hz, 50 Hz, and 100 Hz. The results were used to investigate the Nyquist Sampling Theorem and aliasing.

## Nyquist Analysis

The maximum frequency of the original signal is:

fmax = 10 Hz

According to the Nyquist Sampling Theorem:

fs > 2fmax

Therefore:

fs > 2(10)

fs > 20 Hz

The theoretical Nyquist rate is 20 Hz.

For the sampling frequencies investigated:

* 15 Hz: does not satisfy the Nyquist criterion.
* 20 Hz: is exactly the theoretical Nyquist rate and provides no practical margin.
* 25 Hz: satisfies the strict criterion.
* 50 Hz: satisfies the criterion.
* 100 Hz: satisfies the criterion.

Sampling exactly at the Nyquist rate is generally not recommended in a practical engineering system because real signals can contain noise, harmonics, and other frequency components. A practical system should provide sufficient sampling margin and use appropriate anti-aliasing filtering.

## Results

The original signal is a 10 Hz sine wave with a duration of one second.

At 15 Hz, the sampling frequency is below the Nyquist rate, so the signal is affected by aliasing and cannot be represented correctly.

At 20 Hz, the system operates exactly at the theoretical Nyquist rate. Although this is the minimum theoretical rate, it provides little practical margin.

At 25 Hz, the signal satisfies the Nyquist criterion, but the number of samples per cycle is still relatively small.

At 50 Hz, there are five samples per cycle, giving a clearer representation of the original signal.

At 100 Hz, there are ten samples per cycle, producing an even denser digital representation but requiring more samples and processing.

## Aliasing Discussion

Aliasing occurs when a signal is sampled at a frequency that is too low to represent its highest frequency component correctly. The original signal in this investigation has a frequency of 10 Hz, so the Nyquist rate is 20 Hz. The 15 Hz sampling frequency is below this rate and therefore causes aliasing. The sampled points cannot represent the original 10 Hz waveform correctly, resulting in an incorrect apparent signal.

Sampling at exactly 20 Hz is the theoretical Nyquist rate, but it is not recommended for a practical engineering system because it provides no margin for noise, harmonics, measurement errors, or other frequency components. In practice, the sampling frequency should be comfortably higher than twice the highest frequency of interest.

For this system, 50 Hz is a reasonable engineering choice. It provides five samples per cycle of the 10 Hz signal, giving a clearer digital representation than 25 Hz while requiring less data and processing than 100 Hz. A practical system should also use an appropriate anti-aliasing filter before sampling to attenuate unwanted higher-frequency components.

## Engineering Recommendation

A sampling frequency of 50 Hz is recommended for this investigation. It is sufficiently above the 20 Hz Nyquist rate and provides five samples per cycle of the 10 Hz signal. This gives a clearer representation than sampling at 25 Hz while producing less data and requiring less processing than sampling at 100 Hz.

For a real condition-monitoring system, the final sampling frequency should be selected based on the complete frequency bandwidth of the vibration sensor and the frequencies that need to be monitored. An anti-aliasing filter should also be used before analog-to-digital conversion.

## AI Usage

### AI Tool Used

ChatGPT

### Prompt(s)

"I need help completing a MATLAB assignment about sampling and aliasing. The assignment requires generating a 10 Hz sine wave, sampling it at 15 Hz, 20 Hz, 25 Hz, 50 Hz, and 100 Hz, applying the Nyquist theorem, discussing aliasing, and creating MATLAB figures."

### Summary of AI Response

ChatGPT explained how to generate the original 10 Hz sine wave, sample it at the required frequencies, plot the original and sampled signals, calculate the Nyquist rate, and explain aliasing.

### What I Modified

I reviewed and adapted the generated MATLAB code to match the assignment requirements, filenames, and folder structure.

### How I Verified the Results

I ran the MATLAB script and checked the generated figures. I verified that the original signal has a frequency of 10 Hz and that the Nyquist calculation gives 20 Hz. I also checked the sampling periods using Ts = 1/fs and compared the sampled plots at all five frequencies.

Aliasing 
Aliasing occurs when a signal is sampled at a frequency that is too low to represent its highest frequency component correctly. The original signal in this investigation has a frequency of 10 Hz, so the Nyquist rate is 20 Hz. The 15 Hz sampling frequency is below this rate and therefore causes aliasing. The sampled points cannot represent the original 10 Hz waveform correctly, resulting in an incorrect apparent signal.

Sampling at exactly 20 Hz is the theoretical Nyquist rate, but it is not recommended for a practical engineering system because it provides no margin for noise, harmonics, measurement errors, or other frequency components. In practice, the sampling frequency should be comfortably higher than twice the highest frequency of interest.

For this system, 50 Hz is a reasonable engineering choice. It provides five samples per cycle of the 10 Hz signal, giving a clearer digital representation than 25 Hz while requiring less data and processing than 100 Hz. A practical system should also use an appropriate anti-aliasing filter before sampling to attenuate unwanted higher-frequency components.

### Prompt(s)

"I need help completing a MATLAB assignment about sampling and aliasing. The assignment requires generating a 10 Hz sine wave, sampling it at 15 Hz, 20 Hz, 25 Hz, 50 Hz, and 100 Hz, applying the Nyquist theorem, discussing aliasing, and creating MATLAB figures."

### Summary of AI Response

ChatGPT explained how to generate the original 10 Hz sine wave, create sampled versions using different sampling frequencies, plot the original signal together with the samples, calculate the Nyquist rate, and explain aliasing. It also provided MATLAB code for generating and saving the required figures.

### What I Modified

I reviewed the MATLAB code and adapted it to match the required folder structure, filenames, figure requirements, and sampling frequencies in the assignment.

### How I Verified the Results

I ran the MATLAB script and checked that the original signal contained 10 cycles during one second. I verified the sampling periods using Ts = 1/fs and checked the Nyquist calculation manually:

fs > 2(10) = 20 Hz.

I also compared the generated plots for all five sampling frequencies and checked that the image files were created with the required filenames.


Calculation

The highest frequency in the signal is:

$$ f_{max}=10\text{ Hz} $$

According to the Nyquist Sampling Theorem:

$$ f_s \geq 2f_{max} $$

Therefore:

$$ f_s \geq 2(10) $$ $$ \boxed{f_s \geq 20\text{ Hz}} $$

The Nyquist rate is 20 Hz.

| Sampling frequency | Nyquist comparison | Observation             |
| -----------------: | ------------------ | ----------------------- |
|              15 Hz | \(15 < 20\)        | Below Nyquist; aliasing |
|              20 Hz | \(20 = 20\)        | Exactly at Nyquist      |
|              25 Hz | \(25 > 20\)        | Above Nyquist           |
|              50 Hz | \(50 > 20\)        | Above Nyquist           |
|             100 Hz | \(100 > 20\)       | Above Nyquist           |








