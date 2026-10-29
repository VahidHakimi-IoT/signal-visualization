
For this in-class task I loaded a short audio file, found the one thing that shouldn't be in it, filtered it out, and then checked whether the result was actually better.
What's in this repo
`inclassAssingment06.m`: the MATLAB script
`hum_music.wav`: the audio file I worked with
`comparison.png`: original vs filtered (waveforms and spectrograms)
`filtered.wav`: the cleaned-up audio the script saves
About the audio file
`hum_music.wav` is a synthetic test file, not a real recording. It is an 8-second clip of a simple melody with a steady 50 Hz hum mixed in on purpose, so there is one clear problem to find and fix. I generated it with Claude's help because I didn't have a teacher-provided file at hand.
What the script reports when it loads it:
Sample rate: 22,050 Hz
Duration: 8 s
Channels: 1 (mono)
16 bits per sample
What I found
I started by looking at the file before touching it. In the spectrogram there was a thin horizontal line sitting at around 50 Hz for the whole clip, and the average spectrum had a sharp peak in the same place. The script listed the strongest peak as 48.4 Hz. That's slightly off 50 only because the spectrum has about 5 Hz resolution, so it lands in the nearest bin. A steady, narrow tone like this is classic mains hum.
The melody itself sits well above that (notes between roughly 262 and 523 Hz), so the hum and the music don't overlap.
The filter I used
A band-stop (notch) filter, Butterworth, order 4, stop band 45-55 Hz. I applied it with `filtfilt`, which runs the filter forwards and backwards. That means no phase shift, but it also doubles the effective order.
Why band-stop: the problem is one narrow tone. A low-pass wouldn't help, and a high-pass at 50 Hz or above would start cutting into things I want to keep. A narrow notch removes the hum and leaves almost everything else alone.
Did it work?
Yes. I measured the power in two bands before and after:
Band	Before	After	Change
45-55 Hz (the hum)	-16.6 dB	-70.2 dB	-53.6 dB
300-3400 Hz (the music)	-11.3 dB	-11.3 dB	0.0 dB
In `comparison.png` the 50 Hz line is clearly there in the original spectrogram and gone in the filtered one, and the notes look the same. Both spectrograms use the same colour range and the waveforms use the same y-axis, so the comparison is fair.
When I played the two versions (same gain for both), they sounded different: the low steady buzz in the first one was gone in the second, and the melody sounded unchanged to me.
What I might have lost
Anything the music has between 45 and 55 Hz would be cut too. This melody has nothing there, so I measured no change in the useful band. It also wouldn't be true for every recording. A deep bass note near 50 Hz would be hit.
There's one more limit. This filter only removes the 50 Hz fundamental. Real mains hum often comes with harmonics at 100 Hz, 150 Hz and so on, and those would need extra stop bands. This file doesn't have them, so one notch was enough.
How to run it
Put `inclassAssingment06.m` and `hum_music.wav` in the same folder.
Open the script in MATLAB (it needs the Signal Processing Toolbox) and make that folder the current folder.
Press Run.
The script prints the file info and the dB results, opens three figures (inspection, original vs filtered, spectrum overlay), plays the original then the filtered audio, and saves `comparison.png` and `filtered.wav`.
To try a different file, change `fileName` at the top and set `filterType` and `cutoffHz` to suit the problem (for example `'lowpass'` for hiss or `'highpass'` for rumble).
AI use
I used Claude to help write the MATLAB script, to generate the test audio file, and to help word this write-up. I checked the work by running the script myself in MATLAB, reading the printed file info and dB numbers, looking at the figures, and listening to both versions of the audio.
