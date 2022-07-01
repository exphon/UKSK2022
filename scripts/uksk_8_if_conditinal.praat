clearinfo

male = 0
child = 1

formantCeiling = 5000

if male
	 formantCeiling

elif child
     formantCeiling = 8000
else
	 formantCeiling = 5500 
endif

appendInfoLine: formantCeiling

