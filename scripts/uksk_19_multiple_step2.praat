form Measure phonetic features for segments in a textgrid
    sentence sound_dir ../data/
    sentence output ../output/result.txt
endform


# Add names for F1 and F2
writeInfoLine: "phone",tab$,"word",tab$,"duration",tab$,
   ... "word_duration",tab$,"F1",tab$,"F2",tab$,"F1_Bark",tab$,"F2_Bark"

# to the output file
writeFileLine: output$, "phone",tab$,"word",tab$,"duration",tab$,
   ... "word_duration",tab$,"F1",tab$,"F2",tab$,"F1_Bark",tab$,"F2_Bark"


strings = Create Strings as file list: "list", sound_dir$ +"/"+ "*.wav"
numberOfFiles = Get number of strings

;writeInfoLine: "Number of wave files: ", numberOfFiles

for ifile to numberOfFiles
    selectObject: strings
    sound_file$ = Get string: ifile
    ;appendInfoLine: "Name of wave files: ", ifile,tab$,sound_file$
    basename$ = sound_file$ - ".wav"
    ;appendInfoLine: "Basename: ", basename$

    # Read wave and textgrid files
    Read from file: sound_dir$+"/"+sound_file$
    Read from file: sound_dir$+"/"+basename$+".TextGrid"

    # Formant Object
    selectObject: "Sound 'basename$'"
    To Formant (burg): 0, 5, 5500, 0.025, 50

    # select TextGrid and cound the number of intervals in the tier 2
    selectObject: "TextGrid 'basename$'"
    num_intervals = Get number of intervals: 2
    ;appendInfoLine: "Number of intervals in Tier 2 is: ", num_intervals

    # Loop the interval tiers
    for i from 1 to num_intervals

        phone$ = Get label of interval: 2, i

        if phone$ == "ae" or phone$ == "ei" 
            ... or phone$ == "eh" or phone$ == "iy"

            startTime = Get start point: 2, i
            endTime = Get end point: 2, i
            midTime = startTime + (endTime - startTime)/2
            duration = (endTime - startTime)*1000


            #################
            # IDENTIFY WORD 
            ################
            word_index = Get interval at time: 1, midTime
            word$ = Get label of interval: 1, word_index
            word_start = Get starting point: 1, word_index
            word_end = Get end point: 1, word_index

            word_duration = (word_end - word_start)*1000

            appendInfo: phone$,tab$,word$,tab$,fixed$(duration,2),tab$
            appendInfo: fixed$(word_duration,2),tab$
   
            # output
            appendFile: output$, phone$,tab$,word$,tab$
            appendFile: output$, fixed$(duration,2),tab$
            appendFile: output$, fixed$(word_duration,2),tab$


            ##############################
            # Measure F1 and F2
            ##############################

            selectObject: "Formant 'basename$'"
            f1 = Get value at time: 1, midTime, "Hertz", "Linear"
            f2 = Get value at time: 2, midTime, "Hertz", "Linear"

            f1_Bark = hertzToBark(f1)
            f2_Bark = hertzToBark(f2)

            appendInfo: fixed$(f1,2),tab$,fixed$(f2,2),tab$
            appendInfoLine: fixed$(f1_Bark,2),tab$,fixed$(f2_Bark,2)

            #output
            appendFile: output$, fixed$(f1,2),tab$,fixed$(f2,2),tab$
            appendFileLine: output$, fixed$(f1_Bark,2),tab$,fixed$(f2_Bark,2)

            selectObject: "TextGrid 'basename$'"

        endif
    endfor
endfor