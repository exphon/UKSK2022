# the three periods (...) tell Praat # that the command 
# continues on the next line
headerRow$ = "subject" + tab$ 
		... + "date" + tab$
		... + "vowel" + tab$
		... + "f1" + tab$
		... + "f2" + newline$

# later write out rows in the same format

appendInfoLine: headerRow$
