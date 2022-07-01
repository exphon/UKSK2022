# create object from scratch
sndObj = Create Sound as pure tone: 
   ..."tone", 1, 0, 0.4, 44100, 440, 0.2, 0.01, 0.01

formObj = To Formant (burg): 0, 5, 5500, 0.025, 50

selectObject: sndObj
plusObject: formObj
;Remove
