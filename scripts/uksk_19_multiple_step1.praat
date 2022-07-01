form Measure phonetic features for segments in a textgrid
	 comment Don't forget to end with / in sound_dir
    sentence sound_dir ../data/
    sentence output ../output/result.txt
endform

clearinfo

strings = Create Strings as file list: "list", sound_dir$ + "*.wav"
numberOfFiles = Get number of strings

writeInfoLine: "Number of wave files: ", numberOfFiles

for ifile to numberOfFiles
    selectObject: strings
    sound_file$ = Get string: ifile
    appendInfoLine: "Name of wave files: ", ifile,tab$,sound_file$
    basename$ = sound_file$ - ".wav"
    appendInfoLine: "Basename: ", basename$

    # Read wave and textgrid files
    Read from file: sound_dir$+"/"+sound_file$
    Read from file: sound_dir$+"/"+basename$+".TextGrid"

    # select TextGrid and cound the number of intervals in the tier 2
    selectObject: "TextGrid 'basename$'"
    num_intervals = Get number of intervals: 2
    appendInfoLine: "Number of intervals in Tier 2 is: ", num_intervals
endfor