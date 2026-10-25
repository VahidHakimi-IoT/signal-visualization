# Digital Signal Processing Assignment: Z-Transform and Delays

## Overview

This assignment explores the Z-transform of a discrete-time signal, the effect of a one-sample delay, and a simple digital averaging system using MATLAB.

## Files

- `zTransformdelays.m` — MATLAB script containing the signal generation, one-sample delay, filter calculations, plots, and output verification.
- `README.md` — Explanations and answers to all six assignment questions.
- `screenshots/` — Screenshots of MATLAB plots and Command Window results.

## Part 1: A Signal and Its Z-Transform

The input signal is:

\[
x[0]=1,\quad x[1]=2,\quad x[2]=1
\]

Its Z-transform is:

\[
X(z)=1+2z^{-1}+z^{-2}
\]

### Question 1: Identify each term in X(z)

- \(1\) represents \(x[0]=1\).
- \(2z^{-1}\) represents \(x[1]=2\).
- \(z^{-2}\) represents \(x[2]=1\).

Each coefficient represents a sample amplitude, and its exponent indicates the sample's time index.

### Question 2: Z-transform of the delayed signal

A one-sample delay is defined as:

\[
x_d[n]=x[n-1]
\]

The delayed signal is:

\[
x_d[n]=[0,1,2,1]
\]

Its Z-transform is:

\[
X_d(z)=z^{-1}+2z^{-2}+z^{-3}
\]

Equivalently:

\[
X_d(z)=z^{-1}X(z)
\]

### Question 3: Why does a one-sample delay multiply X(z) by z⁻¹?

A one-sample delay shifts every sample one position to the right. According to the time-shifting property of the Z-transform, delaying a signal by one sample introduces a factor of \(z^{-1}\).

Therefore:

\[
\mathcal{Z}\{x[n-1]\}=z^{-1}X(z)
\]

## Part 2: A System with One-Sample Delay

The system equation is:

\[
y[n]=0.5x[n]+0.5x[n-1]
\]

Its transfer function is:

\[
H(z)=0.5+0.5z^{-1}
\]

### Question 4: Calculate the output by hand

The input samples are \([1,2,1,0]\), and the input is zero before \(n=0\). Thus, \(x[-1]=0\).

For \(n=0\):

\[
y[0]=0.5(1)+0.5(0)=0.5
\]

For \(n=1\):

\[
y[1]=0.5(2)+0.5(1)=1.5
\]

For \(n=2\):

\[
y[2]=0.5(1)+0.5(2)=1.5
\]

For \(n=3\):

\[
y[3]=0.5(0)+0.5(1)=0.5
\]

The output is:

\[
y[n]=[0.5,1.5,1.5,0.5]
\]

These values agree with the expected MATLAB `filter` output.

### Question 5: How does b = [0.5 0.5] represent H(z)?

In MATLAB, the numerator coefficient vector is:

```matlab
b = [0.5 0.5];
a = 1;
```

The transfer function is:

\[
H(z)=b_0+b_1z^{-1}
\]

- The first coefficient, 0.5, multiplies the current input \(x[n]\).
- The second coefficient, 0.5, multiplies the previous input \(x[n-1]\).
- The denominator `a = 1` means there is no feedback term.

### Question 6: Modified system H(z) = 0.8 + 0.2z⁻¹

The coefficients are changed to:

```matlab
b = [0.8 0.2];
a = 1;
```

The new system equation is:

\[
y[n]=0.8x[n]+0.2x[n-1]
\]

The output samples are:

\[
y[n]=[0.8,1.8,1.2,0.2]
\]

The current input has more influence because its coefficient is 0.8, while the previous input has a coefficient of 0.2. The modified system therefore gives greater weight to the current input sample.

## Screenshots and Results

The MATLAB script `zTransformdelays.m` generates the plots and displays the output samples.

The following screenshots should be included in the `screenshots/` folder:

1. `original_and_delayed.png` — Original signal and one-sample delayed signal.
2. `averaging_output.png` — Input and output for \(H(z)=0.5+0.5z^{-1}\).
3. `modified_output.png` — Input and output for \(H(z)=0.8+0.2z^{-1}\).
4. `command_window.png` — MATLAB output samples and verification message.

## Conclusion

This assignment demonstrates the Z-transform of a discrete-time signal, the time-shifting property, and the implementation of a digital filter using MATLAB. The hand calculations match the expected output samples. Changing the filter coefficients changes the relative influence of the current and previous input samples.

