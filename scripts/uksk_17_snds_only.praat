form List Wave files
	comment Select only wave files from a directory
	sentence InputDir ../data/
	sentence Wave *.wav
endform

clearinfo
inputDirWavs$ = inputDir$ + wave$

wavList = Create Strings as file list: "wavList", inputDirWavs$

selectObject: wavList

numFiles = Get number of strings
for fileNum from 1 to numFiles
	fileName$ = Get string: fileNum
	appendInfoLine: fileName$
endfor
