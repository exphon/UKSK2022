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






