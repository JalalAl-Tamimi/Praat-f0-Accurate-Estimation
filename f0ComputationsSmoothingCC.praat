## 01 April 2011: version 1. Using autocorrelation pitch estimate (for details, see Al-Tamimi and Khattab, 2015, JASA, 138(1): 344–360).  
## 25 May 2017: version 2. A few updates (for details, see Al-Tamimi and Khattab, 2018, Journal of Phonetics, Special Issue on VOT, Volume 71, pages: 306-325) 
## 22 August 2020: version 3: new computations based on cross-correlation. See f0ComputationsSmoothingAC.praat for auto-correlation
## Estimation of Pitch is based on the two-pass method.


beginPause: "Accurate f0 estimation"
comment: "Where are your sound files?"
sentence: "directory1", ""
comment: "results file name?"
sentence: "results", "Output"
comment: "Interval Tier containing utterances?"
integer: "Tier", 1
clicked = endPause: "OK", 1

if directory1$ = ""
	directory1$ = chooseDirectory$("Select your directory of sound files and TextGrids")
endif

clearinfo
createDirectory: "PitchFiles"

Create Strings as file list: "list", "'directory1$'\*.wav"

numberOfFiles = Get number of strings
appendFileLine: "'results$'.xls", "File name", tab$, "Sentence", tab$, "Floor", tab$, "Ceiling"

for i from 1 to numberOfFiles
	select Strings list
   	fileName$ = Get string: i

	Read from file: "'directory1$'\'fileName$'"
	name$ = selected$ ("Sound")
	Read from file: "'directory1$'\'name$'.TextGrid"
   	nbIntervals = Get number of intervals: tier
   	for j from 1 to nbIntervals
   		selectObject: "TextGrid 'name$'"
		tierLabel$ = Get label of interval: tier, j
		selectObject: "Sound 'name$'"
		noprogress To Pitch (cc): 0.005, 50, 15, "yes", 0.03, 0.45, 0.01, 0.35, 0.14, 600
		Rename: "Pre"
		q1 = Get quantile: 0, 0, 0.25, "Hertz"
		q3 = Get quantile: 0, 0, 0.75, "Hertz"
		floor = q1*0.75
		ceiling = q3*1.5
		selectObject: "Sound 'name$'"
		noprogress To Pitch (cc): 0.005, floor, 15, "yes", 0.03, 0.45, 0.01, 0.35, 0.14, ceiling
		Rename: "Speaker Adapted"
		Save as text file: directory1$ + "/PitchFiles" + "/" + "'name$'_Corrected_Non_Smoothed" + ".Pitch"

		### smoothed pitch contours
		Smooth: 15
		Rename: "Smoothed 1"
		
		Save as text file: directory1$ + "/PitchFiles" + "/" + "'name$'_Corrected_Smoothed" + ".Pitch"
		appendFileLine: "'results$'.xls", name$, tab$, tierLabel$, tab$, 'floor:2', tab$, 'ceiling:2'
	endfor
	select all
    minusObject: "Strings list"
    Remove
endfor
select all
Remove
echo finished :)
