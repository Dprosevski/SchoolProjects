/**************************************************************************
 Filename: welcome.js
 Written by: Dimitrije Prosevski (DP)
 Purpose: JS for welcome.html
**************************************************************************/

$(document).ready(function() {
	var mateys = new Audio();
	mateys.src = "mateys.mp3";
	var strPrompt = "Welcome aboard pirate, give this man a  bottle o' grog! <br>"
	+ "Enter some text here and we will color it and turn it a tattoo"
	+ "<br>then we will start our journey!";
	var elOutput1 = document.getElementById("captain");
	var elOutput2 = document.getElementById("tattoo");
	elOutput1.innerHTML = strPrompt;

	$('#generate').click(function() {
		var tattoo = new String($('#input').val());
		elOutput2.innerHTML = tattoo;
		mateys.play();
	});

	$("#button1").click(function() {
		$('#tattoo').css("color", "red");
	});

	$("#button2").click(function() {
		$('#tattoo').css("color", "green");
	});

	$("#button3").click(function() {
		$('#tattoo').css("color", "blue");
	});

	$("#button4").click(function() {
		$('#tattoo').css("color", "yellow");
	});

	$("#button5").click(function() {
		$('#tattoo').css("color", "pink");
	});

	$("#button6").click(function() {
		$('#tattoo').css("color", "black");
	});

	$("#button7").click(function() {
		$('#tattoo').css("color", "gray");
	});

}); //doc.ready ends