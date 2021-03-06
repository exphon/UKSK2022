## PART I

sound$ = Read from file: "../data/dhl_part.wav"
textgrid$ = Read from file: "../data/dhl_part.TextGrid"

# select Sound file

selectObject: "Sound dhl_part"

totalDuration = Get total duration
writeInfoLine: "Total duration: ", fixed$(totalDuration, 2), " seconds"

# Select TextGrid file

selectObject: "TextGrid dhl_part"

numberOfTiers = Get number of tiers
appendInfoLine: "Number of tiers is: ", numberOfTiers


## PART II (modified)

# print out phone tier information line by line 

num_intervals = Get number of intervals: 2
appendInfoLine: "Number of intervals on Tier 2 is: ", num_intervals

appendInfoLine: "phone",tab$,"duration"

# Loop the interval tiers
for i from 1 to num_intervals

    phone$ = Get label of interval: 2, i

    if phone$ == "ae" or phone$ == "ei" 
       ... or phone$ == "eh" or phone$ == "iy"
        startTime = Get start point: 2, i
        endTime = Get end point: 2, i
        duration = (endTime - startTime)*1000
        appendInfoLine: phone$,tab$,fixed$(duration,2)
    endif
endfor



