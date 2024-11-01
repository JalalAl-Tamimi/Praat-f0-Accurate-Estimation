To access scripts and supporting documents, download the whole repository from [here](https://github.com/JalalAl-Tamimi/Praat-f0-Accurate-Estimation). You can access it by clicking on "View on GitHub" on top.

There are two version of the scripts:

1) The scripts "f0ComputationsSmoothingAC_v2.praat" or "f0ComputationsSmoothingCC_v2" are best to be used if you have a Praat version 6.3.22 or below.
2) The scripts "f0ComputationsSmoothingAC_v3.praat" or "f0ComputationsSmoothingCC_v3" are to be used for any version of Praat above 6.4. These new versions use the updated Praat algorithm for detection of pitch

The two variants of the scirpts use either the Autocorrelation method (AC) or Crosscorrelation (CC). They provide an automated method to accurately estimate f0 using Praat. The first script uses the autocorrelation method for intonation, the second uses the cross-correlation method for voice quality.  
Starting from a sound file and a TextGrid, the script computes f0 using the two-pass method: first by estimating f0 broadly, then adapting 
the floor and ceiling to a specific speaker's range. The script works iteratively through a folder containing sounds files and TextGrids, 
then saves a file with details of each of the floor and ceiling per "file" and speaker. The pitch object adapted to each speaker is saved 
alongside a smoothed pitch object.

An example of a TextGrid and Sound file are provided in addition to an excel sheet. Sound file and TextGrid courtesy of Hajar Moussa.

See the following references for more details on the method:

* Al-Tamimi, J., & Khattab, G. (2015). "Acoustic cue weighting in the singleton vs geminate contrast in Lebanese Arabic: The case of fricative consonants". Journal of the Acoustical Society of America, 138(1), 344–360. https://doi.org/10.1121/1.4922514
* Al-Tamimi J. (2017). "Revisiting acoustic correlates of pharyngealization in Jordanian and Moroccan Arabic: Implications for formal representations". Laboratory Phonology: Journal of the Association for Laboratory Phonology, 8(1): 1-40. http://doi.org/10.5334/labphon.19
* Al-Tamimi, J. and Khattab, G., (2018). Acoustic correlates of the voicing contrast in Lebanese Arabic singleton and geminate stops. Invited manuscript for the special issue of Journal of Phonetics, "Marking 50 Years of Research on Voice Onset Time and the Voicing Contrast in the World’s Languages" (eds., T. Cho, G. Docherty & D. Whalen)." Vol: 71, pp. 306-325. https://doi.org/10.1016/j.wocn.2018.09.010


