# Lecture 5: Fourier Series, DTFT and DFT

## AI-use note
I used Claude to help me understand MATLAB syntax (subplot, exportgraphics, fft
scaling). I ran all the code
myself, checked the results against my predictions, and wrote the
explanations in my own words.

---

## Exercise 1: Square wave from harmonics

**Prediction (written before running):** 1, 1, 1 ,1 

**Results:** max(x) for H = 1, 3, 9, 25 was 1.27, 1.20, 1.18, 1.17.

**What changes as H increases:** The ripple gets narrower and squeezes against the jump, while its height stays the same.

**Near the sharp transitions:** As H increases, the waveform gets closer to a square wave: flatter tops and bottoms near ±1, steeper transitions, and more but smaller ripples. Near the jumps, there is an overshoot of about 18% of the amplitude (about 9% of the full jump) that does not shrink as H grows. It only gets narrower.

---

## Exercise 2: Two frequencies with the FFT

**Prediction:**

| Component | Frequency | Amplitude |
|---|---|---|
| 1 | 15 Hz | 0.8 |
| 2 | 40 Hz | 0.4 |

**Measured:** peaks at 15.00 Hz (0.8000) and 40.00 Hz (0.4000).

**Bin spacing:**
N = fs × T = 200 × 1 = 200 samples
Δf = fs / N = 200 / 200 = 1 Hz (equal to 1/T)

**Why the peaks are so clean:** In the one-second recording, the 15 Hz sine completes exactly 15 whole cycles and the 40 Hz sine completes exactly 40 whole cycles. Since the bin spacing is 1 Hz, both frequencies are whole-number multiples of it (15 × 1 and 40 × 1), so they fall exactly on DFT bins. The energy of each sine lands in a single bin, which is why the spectrum shows two clean spikes with the exact amplitudes 0.8 and 0.4 and almost nothing elsewhere.

---

## Exercise 3: Spectral leakage

**d = 1**, so f2 = 13.2 + 0.17 × 1 = 13.37 Hz.

**Prediction:** a single sharp spike at 0.40. 

**Measured:**

| Case | Bin spacing | Peak near f2 | True amplitude |
|---|---|---|---|
| 1 s | 1 Hz | 0.3173 | 0.4 |
| 4 s | 0.25 Hz | 0.2658 | 0.4 |
| 1 s, zero-padded 4x | 0.25 Hz | 0.3639 | 0.4 |

**Explanation:**
- 1 s: Since the frequency of the second signal is 13.37 Hz, it does not complete a whole number of cycles in 1 second. Therefore, its frequency does not match an exact FFT frequency bin. Its energy spreads across several nearby frequency bins. This is called spectral leakage.

1 s vs 4 s: When the recording duration increases from 1 second to 4 seconds, the frequency spacing decreases from 1 Hz to 0.25 Hz. This makes the frequency peak narrower and improves frequency resolution. However, the peak is still slightly below the actual amplitude of 0.4 because 13.37 Hz falls between two FFT bins (13.25 Hz and 13.5 Hz).

Zero-padding: Zero-padding makes the frequency spectrum look smoother by adding more points to the FFT. It can make the peak appear higher because the frequency grid becomes finer. However, it does not add new information to the original signal or improve the true frequency resolution. The actual resolution remains the same as in the 1-second recording.

---

## Exercise 4: DTFT vs DFT

**Prediction:** angular frequency and value
 at w = 0 is 4

**Results:** `abs(fft(x,4))` = [4, 0, 0, 0]. DTFT peak =4
at w = 0.

**Task 4, DTFT vs DFT:** DTFT produces a continuous frequency spectrum. DFT produces a finite number of frequency samples. For a signal with 4 samples, the DFT gives 4 frequency values. 

**Task 5, why fft(x,64) gives more points:** fft(x,64) zero-pads the 4 samples with 60 zeros, so it evaluates the same DTFT at 64 frequencies instead of 4. No new samples of the sequence are added, only zeros, so there is no new information. It just samples the same smooth curve more densely, like the zero-padded spectrum in Exercise 3.

**Task 6, zeros of the DTFT:** The DTFT magnitude is |sin(2w)/sin(w/2)|. It is zero when sin(2w) = 0, i.e. w = kπ/2, except at w = 0 where the limit is 4. So the zeros in -π to π are at w = ±π/2 and ±π, which matches my plot.
