## PART I

sound$ = Read from file: "../data/dhl_part.wav"
textgrid$ = Read from file: "../data/dhl_part.TextGrid"

# select Sound file

selectObject: "Sound dhl_part"

totalDuration = Get total duration
writeInfoLine: "Total duration: ", fixed$(totalDuration, 2), " seconds"

# Make formant Object
######################

selectObject: "Sound dhl_part"
To Formant (burg): 0, 5, 5500, 0.025, 50


# Select TextGrid file

selectObject: "TextGrid dhl_part"

numberOfTiers = Get number of tiers
appendInfoLine: "Number of tiers is: ", numberOfTiers




## PART II (modified)


# print out phone tier information line by line 

num_intervals = Get number of intervals: 2
appendInfoLine: "Number of intervals on Tier 2 is: ", num_intervals

# Add names for F1 and F2
appendInfoLine: "phone",tab$,"duration",tab$,"F1",tab$,"F2"

# Loop the interval tiers
for i from 1 to num_intervals

    phone$ = Get label of interval: 2, i

    if phone$ == "ae" or phone$ == "ei" 
       ... or phone$ == "eh" or phone$ == "iy"
        startTime = Get start point: 2, i
        endTime = Get end point: 2, i
        midTime = startTime + (endTime - startTime)/2
        duration = (endTime - startTime)*1000
        # Note: appendInfoLine --> appendInfo + tab$ at the end
        appendInfo: phone$,tab$,fixed$(duration,2),tab$


        #########################
        # Measure F1 and F2
        #########################
        selectObject: "Formant dhl_part"
        f1 = Get value at time: 1, midTime, "Hertz", "Linear"
        f2 = Get value at time: 2, midTime, "Hertz", "Linear"
        appendInfoLine: fixed$(f1,2),tab$,fixed$(f2,2)
         

        selectObject: "TextGrid dhl_part"

    endif


endfor




