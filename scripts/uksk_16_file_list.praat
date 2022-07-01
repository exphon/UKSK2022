clearinfo
inDir$ = "../scripts/"

fileList = Create Strings as file list: "fList", inDir$

selectObject: fileList

numFiles = Get number of strings
for fileNum from 1 to numFiles
	fileName$ = Get string: fileNum
	Randomize
	appendInfoLine: fileName$
endfor
