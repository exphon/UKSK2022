
#select by name
selectObject: "Sound hVd_tjy"

#select by object number
selectObject: 1
# variable 
sndObj = Create Sound as pure tone: 
   ..."tone", 1, 0, 0.4, 44100, 440, 0.2, 0.01, 0.01
selectObject: sndObj