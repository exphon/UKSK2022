clearinfo
appendInfoLine: "Insert a pencil in the sharpener."
repetition = 15
for i from 1 to repetition
     if i == 1
		   appendInfoLine: "Turn the handle once."
     else
    		appendInfoLine: "Turn the handle ", i, " times."
     endif
endfor
appendInfoLine: "Remove the pencil from the sharpener."
