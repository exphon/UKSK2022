form This is on the top of the Window
	comment This is a form
	comment I am uneditable text used for messages to the user.
	real Real_number_form 5
	text Enter_text_form You can enter text here
endform

clearinfo
appendInfoLine: "Form values: ", real_number_form,"tab$",
               ... enter_text_form$