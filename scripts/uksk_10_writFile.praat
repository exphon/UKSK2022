outDir$ = "../output/"

outFile1$ = outDir$ + "outFile1.txt"
outFile2$ = outDir$ + "outFile2.txt"

wMessage$ = "I'm writing, 'I love experimental phonetics'."
aMessage$ = "I'm appending, 'I love experimental phonetics '."

# let's write the message five times
for i from 1 to 5
	writeFile: outFile1$, wMessage$
endfor

# now we'll append 5 times
for 1 from 1 to 5
	appendFile: outFile2$, aMessage$
endfor
