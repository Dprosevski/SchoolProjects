$(document).ready(function() {
	//tab 1
	$( "input[id='submit1']" ).button();
	//tab 2
	$( "input[id='submit2']" ).button();
	$( "input[id='reset2']" ).button();

	$('#outputcalc').hide();
	$('#outputpers').hide();

	$( "#tabs" ).tabs();

	$( "#datepicker" ).datepicker({
		inline: true
	});

	$( "#slider" ).slider({
		min: 1,
		max: 10,
		value: 1,
		slide: function(event, ui) {
			$('#grade').val(" " + ui.value);
		}
	});

	$('#grade').val(" " + $('#slider').slider( "values", 0 ));

	//for planet X parameters
	$(".toggleThis").hide();

	$("#radio9").click(function() {
	    $('.toggleThis').fadeIn(2000);
	});

	$(".ssp").click(function() {
	    $('.toggleThis').fadeOut(2000);
	});


	//SlideShow
	var loopid = ["#radio1","#radio2","#radio3","#radio4","#radio5","#radio6","#radio7","#radio8","#radio9"];//array with images ids

	$(loopid[0]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}//loop all index values to 0
		x[0].style.display = "block";});//displaying the checked one

	$(loopid[1]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[1].style.display = "block";});

	$(loopid[2]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[2].style.display = "block";});

	$(loopid[3]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[3].style.display = "block";});

	$(loopid[4]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[4].style.display = "block";});

	$(loopid[5]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[5].style.display = "block";});

	$(loopid[6]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[6].style.display = "block";});

	$(loopid[7]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[7].style.display = "block";});

	$(loopid[8]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[8].style.display = "block";});

	$(loopid[9]).click(function() {	
		for (i = 0; i < x.length; i++) {x[i].style.display = "none";}
		x[9].style.display = "block";});


	$(".arrows").click(function() {
		if(x[0].style.display == "block"){document.getElementById("radio1").click()}
		if(x[1].style.display == "block"){document.getElementById("radio2").click()}
		if(x[2].style.display == "block"){document.getElementById("radio3").click()}
		if(x[3].style.display == "block"){document.getElementById("radio4").click()}
		if(x[4].style.display == "block"){document.getElementById("radio5").click()}
		if(x[5].style.display == "block"){document.getElementById("radio6").click()}
		if(x[6].style.display == "block"){document.getElementById("radio7").click()}
		if(x[7].style.display == "block"){document.getElementById("radio8").click()}
		if(x[8].style.display == "block"){document.getElementById("radio9").click()}
	});
}); //doc.ready ends