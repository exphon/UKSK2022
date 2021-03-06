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


## PART II

# print out phone tier information line by line 

num_intervals = Get number of intervals: 2
appendInfoLine: "Number of intervals on Tier 2 is: ", num_intervals

# Loop the interval tiers
for i from 1 to num_intervals

    phone$ = Get label of interval: 2, i
    appendInfoLine: phone$

endfor

