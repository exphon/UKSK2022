outDir$ = "../output/"
outFile$ = outDir$ + "outFile1.txt"
if fileReadable: outFile$
	pauseScript: "File exists! Overwrite?"
endif
deleteFile: outFile$