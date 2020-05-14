/**************************************************************************
 Filename: gameJS1.js
 Written by: Dimitrije Prosevski (DP)
 Purpose: JS for game1.html
**************************************************************************/

$(document).ready(function() {
	var crowd = new Audio();
	crowd.src = "crowd.mp3";
	var strQuestion = "How many numbers are you capable of repeating from your memory?";
	var strDef = "6";
	var strNum = prompt(strQuestion,strDef);
	var intNum = parseInt(strNum);
	var count = 0;

	var strPrompt = "Arghhh, I'll tell you a number every two seconds, you have only 3 attempts!";	
	var elOutput1 = document.getElementById("captain1");
	elOutput1.textContent = strPrompt;

	//prompt numbers
	var intRndNums = "";
	var elOutput2 = document.getElementById("promptNums");
	$('#start').click(function() {
	  var started = Date.now();
	  $('#promptNums').show();
	  var interval = setInterval(function(){
	    if (Date.now() - started > ((intNum)*2000)+100) {
	      	clearInterval(interval);
	      	$('#check').show();
	      	$('#check').click(function() {
	   			$('#promptNums').hide();
	   			$('#captain2').show();
	   			$('#input').show();
	   			$('#verify').show();
	   			$('#check').hide();
			});
	   		
			$('#verify').click(function() {
				count++;
	   			var checkNums = new String($('#input').val());
	      		if(checkNums == intRndNums) {
	      			alert("Ayee, good lad, got one more challenge for you!");
	      			crowd.play();
	      			$('#secondGame').show();
	      		}
	      		if (count == 3) {
	      			window.location.href = "fail.html";
	      		}
			});

	    }
	    else {
	    	intRnd = [1+Math.floor(Math.random() * 9)];
	      	elOutput2.textContent += intRnd;
	      	intRndNums += intRnd;
	    }
	  }, 2000);
	});

}); //doc.ready ends