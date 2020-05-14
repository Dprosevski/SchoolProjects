/**************************************************************************
 Filename: gameJS2.js
 Written by: Dimitrije Prosevski (DP)
 Purpose: JS for game2.html
**************************************************************************/

$(document).ready(function() {
	var crowd = new Audio();
	crowd.src = "crowd.mp3";
	//captain's number
	var intRnd = [1+Math.floor(Math.random() * 10)];
	var intNum = parseInt(intRnd);
	var count = 0;

	var strPrompt1 = "Arghh in this challenge you gotta guess my number between 1-10 matey! <br>Tell me your answer and I'll let ya know " 
	+ "if its too high or low, careful tho you only have 4 shots, use it wisely!";

	var strPrompt2 = "Ayee matey, welcome aboard!";	

	var elOutput1 = document.getElementById("captain");
	elOutput1.innerHTML = strPrompt1;

	$('#verify').click(function() {
	   	var checkNum = new Number($('#input').val());
	    if(checkNum == intNum) {
			elOutput1.innerHTML = strPrompt2;
			crowd.play();
	      	$('#welcome').show();
	    }
	    if(checkNum < intNum) {
			elOutput1.innerHTML = "Try higher";
			count++;
	    }
	    if(checkNum > intNum) {
			elOutput1.innerHTML = "Try lower";
			count++;
	    }

	    if(count == 4) {
			window.location.href = "fail.html";
	    }
	});
	
}); //doc.ready ends