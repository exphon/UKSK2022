outDir$ = "../output/"
# use commas for separator
sep$ = ","
outFile4$ = outDir$+"vowel.csv"
# Column names
header$ = "name"+sep$+"Age"+sep$+"Vowel"+sep$+"F0"
       ...+sep$+"F1"+sep$+"F2"+newline$
writeFile: outFile4$, header$
# note that the numbers are actually strings!
yoon$ = "Yoon"+sep$+"20"+sep$+"i"+sep$+"120"+sep$
	...+"240"+sep$+"2300"+newline$
kim$ = "Kim"+sep$+"22"+sep$+"i"+sep$
	...+"114"+sep$+"230"+sep$+"2400"+newline$
lee$ = "Lee"+sep$+"19"+sep$+"e"+sep$
	...+"119"+sep$+"340"+sep$+"2100"+newline$
appendFile: outFile4$, yoon$
appendFile: outFile4$, kim$
appendFile: outFile4$, lee$
