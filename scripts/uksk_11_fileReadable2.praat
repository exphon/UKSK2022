outDir$ = "../output/"
askBeforeDelete = 1

outFile2$ = outDir$ + "outFile2.txt"

if askBeforeDelete and fileReadable: outFile2$
	pauseScript: "File exists. Overwrite?"
endif

deleteFile: outFile2$

aMessage$ = "I'm appending, 'I love experimental phonetics!'."
for i from 1 to 5
	appendFileLine: outFile2$, aMessage$
endfor
