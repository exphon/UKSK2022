form output filename
    sentence output ../output/result.txt
endform

sound$ = Read from file: "../data/dhl_part.wav"
textgrid$ = Read from file: "../data/dhl_part.TextGrid"

# select Sound file

selectObject: "Sound dhl_part"

totalDuration = Get total duration
writeInfoLine: "Total duration: ", fixed$(totalDuration, 2), " seconds"

# Make formant Object

selectObject: "Sound dhl_part"
To Formant (burg): 0, 5, 5500, 0.025, 50


# Select TextGrid file

selectObject: "TextGrid dhl_part"

numberOfTiers = Get number of tiers
appendInfoLine: "Number of tiers is: ", numberOfTiers




## PART II (modified)


# print out phone tier information line by line 

num_intervals = Get number of intervals... 2
appendInfoLine: "Number of intervals on Tier 2 is: ", num_intervals


# Add names for F1 and F2
writeInfoLine: "phone",tab$,"word",tab$,"phone_duration",tab$,
   ... "word_duration",tab$,"F1",tab$,"F2",tab$,"F1_Bark",tab$,"F2_Bark"

# to the output file
writeFileLine: output$, "phone",tab$,"word",tab$,"phone_duration",tab$,
   ... "word_duration",tab$,"F1",tab$,"F2",tab$,"F1_Bark",tab$,"F2_Bark"

# Loop the interval tiers
for i from 1 to num_intervals

    phone$ = Get label of interval: 2, i

    if phone$ == "ae" or phone$ == "ei" 
       ... or phone$ == "eh" or phone$ == "iy"

        startTime = Get start point: 2, i
        endTime = Get end point: 2, i
        midTime = startTime + (endTime - startTime)/2
        phone_duration = (endTime - startTime)*1000


       #################
        # IDENTIFY WORD 
        ################
        word_index = Get interval at time: 1, midTime
        word$ = Get label of interval: 1, word_index


        word_start = Get starting point: 1, word_index
        word_end = Get end point: 1, word_index

        word_duration = (word_end - word_start)*1000


        # Note: appendInfoLine --> appendInfo + tab$ at the end
        appendInfo: phone$,tab$,word$,tab$,fixed$(phone_duration,2),tab$
        appendInfo: fixed$(word_duration,2),tab$
   
        # output
        appendFile: output$, phone$,tab$,word$,tab$
        appendFile: output$, fixed$(phone_duration,2),tab$
        appendFile: output$, fixed$(word_duration,2),tab$


        ##############################
        # Measure F1 and F2
        ##############################

        selectObject: "Formant dhl_part"
        f1 = Get value at time: 1, midTime, "Hertz", "Linear"
        f2 = Get value at time: 2, midTime, "Hertz", "Linear"

        ## CHANGE TO BARK
        ############################################
        #  IN R
        #      hertz = seq(1, 5000, 1)
        #      Bark = 7*log(hertz/650+sqrt(1+(hertz/650)^2))
        #      plot(hertz, Bark, type="b")
        #      grid()
        #############################################

        # http://www.fon.hum.uva.nl/praat/manual/Formulas_4__Mathematical_functions.html
        f1_Bark = hertzToBark(f1)
        f2_Bark = hertzToBark(f2)

        appendInfo: fixed$(f1,2),tab$,fixed$(f2,2),tab$
        appendInfoLine: fixed$(f1_Bark,2),tab$,fixed$(f2_Bark,2)

        #output
        appendFile: output$, fixed$(f1,2),tab$,fixed$(f2,2),tab$
        appendFileLine: output$, fixed$(f1_Bark,2),tab$,fixed$(f2_Bark,2)

        selectObject: "TextGrid dhl_part"

    endif
endfor
