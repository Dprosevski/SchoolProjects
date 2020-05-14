/**************************************************************************
 Filename: satellite.js
 Written by: Dimitrije Prosevski (DP)
 Purpose: Satellite simulator done in JS
 Date: 20 Dec 2018
 Modification History:
 Original Build
**************************************************************************/

$(document).ready(function() {

//global variables
var planet = ""; //declaring a string to set it equal to array for radios

/**************************************************************************
 Function name: takeInputCalc
 Purpose: Purpose of the function is to take the input and echo it back#x
 Parameters: NONE
 Return value: NONE
**************************************************************************/
function takeInputCalc(){

	/**************************************************************************
	 Function name: checkingRadios
	 Purpose: Purpose of the function is to check "Radios"
	 Parameters: form
	 Return value: false
	**************************************************************************/
	function checkingRadios(form) {
	    var checkRadio1 = document.getElementById("radio1").checked; //declaring Radio 1 boolean
	    var checkRadio2 = document.getElementById("radio2").checked; //declaring Radio 2 boolean
	    var checkRadio3 = document.getElementById("radio3").checked; //declaring Radio 3 boolean
	    var checkRadio4 = document.getElementById("radio4").checked; //declaring Radio 4 boolean
	    var checkRadio5 = document.getElementById("radio5").checked; //declaring Radio 5 boolean
	    var checkRadio6 = document.getElementById("radio6").checked; //declaring Radio 6 boolean
	    var checkRadio7 = document.getElementById("radio7").checked; //declaring Radio 6 boolean
	    var checkRadio8 = document.getElementById("radio8").checked; //declaring Radio 6 boolean
	    var checkRadio9 = document.getElementById("radio9").checked; //declaring Radio 6 boolean
	    
	    if(checkRadio1) {var radio1 = new String($('#radio1').val()); //declaring a string for Radio 1 value
		}
	    if(checkRadio2) {var radio2 = new String($('#radio2').val()); //declaring a string for Radio 2 value
		}
		if(checkRadio3) {var radio3 = new String($('#radio3').val()); //declaring a string for Radio 3 value
		}
		if(checkRadio4) {var radio4 = new String($('#radio4').val()); //declaring a string for Radio 4 value
		}
		if(checkRadio5) {var radio5 = new String($('#radio5').val()); //declaring a string for Radio 5 value
		}
		if(checkRadio6) {var radio6 = new String($('#radio6').val()); //declaring a string for Radio 6 value
		}
		if(checkRadio7) {var radio7 = new String($('#radio7').val()); //declaring a string for Radio 7 value
		}
		if(checkRadio8) {var radio8 = new String($('#radio8').val()); //declaring a string for Radio 8 value
		}
		if(checkRadio9) {var radio9 = new String($('#radio9').val()); //declaring a string for Radio 9 value
		}

		var radioArray = [radio1, radio2, radio3, radio4, radio5, radio6, radio7, radio8, radio9]; //declaring a string array to loop through radios
		var promptRadioArray = []; //declaring a string array to be prompted
		
		for(i=0; i<=radioArray.length; i++){
			if(radioArray[i] != null){
				promptRadioArray[i] = radioArray[i];
				planet = promptRadioArray[i];
			}
		}

		return false;  
	}; //end of checkingRadios()


	//TAB 1
	//satellite
	var radio1 = new String($('#radio1').val()); //declaring radio 1 string
	var radio2 = new String($('#radio2').val()); //declaring radio 2 string
	var radio3 = new String($('#radio3').val()); //declaring radio 3 string
	var radio4 = new String($('#radio4').val()); //declaring radio 4 string
	var radio5 = new String($('#radio5').val()); //declaring radio 5 string
	var radio6 = new String($('#radio6').val()); //declaring radio 6 string
	var radio7 = new String($('#radio7').val()); //declaring radio 7 string
	var radio8 = new String($('#radio8').val()); //declaring radio 8 string
	var radio9 = new String($('#radio9').val()); //declaring radio 9 string
	var mass = new Number($('#mass').val()); //declaring mass integer
	var alt = new Number($('#alt').val()); //declaring altitude integer
	var nameX = new String($('#nameX').val()); //declaring name integer
	var gX = new Number($('#gX').val()); //declaring name integer
	var rX = new Number($('#rX').val()); //declaring name integer
	var MX = new Number($('#MX').val()); //declaring name integer
	var TX = new Number($('#TX').val()); //declaring name integer
	checkingRadios(); //calling the function to check Radio value
	
	var outPut = document.getElementById("calculations"); //declaring output by element id
	//declaring satelliteConcat to concatinate all the fields' values
	var satelliteConcat = 
		"<br><br><br>Planet selected: " + planet
		+ "<br>Mass of the satellite: " + mass
		+ "<br>Altitude of the satellite: " + alt;
	outPut.innerHTML = satelliteConcat;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/**************************************************************************
	 Function name: Planet
	 Purpose: Purpose of the function is to create a planet object
	 Parameters: satMass, satAlt, planets, gravity, radius, planetMass, temeperature, id
	 Return value: NONE
	**************************************************************************/
	function Planet(satMass, satAlt, planets, gravity, radius, planetMass, temeperature, id, nameX, gX, rX, MX, TX){

		if(planet != "Planetx"){
			this.m = satMass;
			this.alt = satAlt;
			this.name = planets;
			this.g = gravity;
			this.r = radius;
			this.M = planetMass;
			this.T = temeperature;
			this.replaceElement = document.getElementById(id);
			var G = 6.673e-11;
		}

		//planet X
		if(planet == "Planetx"){
			this.m = satMass;
			this.alt = satAlt;
			this.name = nameX;
			this.g = gX;
			this.r = rX;
			this.M = MX;
			this.T = TX;
			this.replaceElement = document.getElementById(id);
			var G = 6.673e-11;
		}


		this.surfaceWeight = function() {
			var W = this.g * this.m;
			return W;
		}

		this.orbitalRadius = function() { //calculates orbital radius = distance of satelite to the surface (altitude) + radius of planet
			var R = this.alt + this.r;
			return R;
		}

		this.gForce = function() { //calculates centripetal force      ||| F = GMm/R^2
			var F = (G*this.M*this.m) / Math.pow(this.orbitalRadius(),2);
			return F.toFixed(6);
		}

		this.orbitalVel = function() { //calculates orbital velocity      ||| V = sqrt((GM/R)
			V = Math.sqrt((G*this.M) / this.orbitalRadius());
			return V.toFixed(4);
		}

		this.escapeVel = function() { //calculates escape velocity    ||| V = sqrt((2GM/R)
	        Vesc = Math.sqrt((2*G*this.M) / this.orbitalRadius());
			return Vesc.toFixed(4);
		}

		this.acceleration = function() { //calculates centripetal acceleration     ||| a = V^2/R
		    a = Math.pow(V,2) / this.orbitalRadius();
			return a.toFixed(8);
		}

		this.momentum = function() { //calculates momentum    ||| L = m * sqrt(GMR)
		    L = this.m * Math.sqrt(G * this.M * this.orbitalRadius());
			return L.toFixed(4);
		}

		this.period = function() { //calculates the period of an object    ||| P = sqrt [(4 * pi^2 * R^3) / (G*M)], pi = 3.14159
		    P = Math.sqrt((4 * Math.pow(3.14159,2) * Math.pow(this.orbitalRadius(),3)) / (G * this.M));
			return P.toFixed(4);
		}		

		var border = "&#x2550".repeat(49);//unicode chars

		var surfaceWeightPrompt = "<br>Mass of satellite is " + this.m + " kg times " + this.name + "'s gravity " + this.g
		+ " m/s" + "2".sup()+ ". " + "We can calculate gravitational weight if satellite lands on " + this.name
		+ "'s surface:<br>" + "W = gm  <br>W = " + this.surfaceWeight() + " N<br>" + border;

		var orbitalRadiusPrompt = "<br>Orbital radius (R) of the satellite is a sum of radius of " + this.name + " " 
		+ this.r + " m and altitude of the satellite " + this.alt + " m. Which makes R: <br>"
		+ "R = r + alt <br>R = " + this.orbitalRadius() + " m<br>" + border;

		var gForcePrompt = "<br>" + this.name + " attracts the satellite with the gravitational force (Fg). Equation for Fg:<br>"
        + "Fg = GMm/R" + "2".sup() + " <br>Fg = " + this.gForce() + " N <br>Where M is the mass of " + this.name 
        + ", R is an orbital radius of satellite, G is universal constant 6.673e-11"
        + " Nm" + "2".sup() + "/kg" + "2".sup() + " and m is the mass of satellite.<br>" + border;

        var orbitalVelPrompt = "<br>The satellite is exerting centripetal force (Fc) on the " + this.name 
        + " which is equal to the gravitation force (Fg) that " + this.name + " is exerting on the satellite.<br>"
        + "Setting Fc equal to Fg, we can calculate velocity (V) of the the satellite using Newton's laws."
        +  " Solving for V equation goes: <br>V = sqrt[(GM)/R] <br>V = " + this.orbitalVel() + " m/s<br>" + border;

        var escapeVelPrompt = "<br>The escape velocity (Vesc) is the minimum velocity required to overcome the pull of gravity:"
        + "<br>Vesc = sqrt[(2GM)/R] <br>Vesc = " + this.escapeVel() + " m/s<br>" + border;

        var accelerationPrompt = "<br>Centripetal acceleration (a) is the rate of change in the satellite's velocity while orbiting:"
        + "<br>a = V" + "2".sup() + "/R <br>a = " + this.acceleration() + " m/s" + "2".sup() + "<br>" + border;

        var momentumPrompt = "<br>Orbital Angular momentum (L) is the rotational equivalent of linear momentum:"
        + "<br>L = m[sqrt(GMR)] <br>L = " + this.momentum() + " kgm" + "2".sup() + "/s<br>" + border;

        var periodPrompt = "<br>Next, we can calculate period (P), which is how long it takes the satellite to orbit around "
        + this.name + " one time:<br>P = sqrt[(4 * &#x3C0" + "2".sup() + " * R" + "3".sup() + ") / (G*M)] <br>P = " + this.period() 
        + " s = " + (this.period()/60).toFixed(4) + " min" + " = " + (this.period()/3600).toFixed(4) + " h";


		this.replaceElement.innerHTML = 
			//planet's parameters
			"Calculations for " + this.name + ":"
			+ "<br>Gravity: " + this.g + " m/s" + "2".sup()
			+ "<br>Radius: " + this.r + " m"
			+ "<br>Mass: " + this.M + " kg"
			+ "<br>Average temeperature: " + this.T + " &#x2103<br>" + border //Celsius Unicode
			//calculations
			+ "<br>Calculations for the satellite:"
			+ surfaceWeightPrompt
			+ orbitalRadiusPrompt
			+ gForcePrompt
			+ orbitalVelPrompt
			+ escapeVelPrompt
			+ accelerationPrompt
			+ momentumPrompt
			+ periodPrompt;
	} //Planet object ends



	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	switch(true){
	case(planet == "Mercury"):
		// 						sMass  sAlt   planet 	g 		r		 M	  	 T    id
		var Mercury = new Planet(mass, alt, "Mercury", 3.7, 1516000, 3.285e+23, 167, "calculations", null, null, null, null)
		break;

	case(planet == "Venus"):
		var Venus = new Planet(mass, alt, "Venus", 8.87, 3760000, 4.867e+24, 462, "calculations", null, null, null, null)
		break;

	case(planet == "Earth"):
		var Earth = new Planet(mass, alt, "Earth", 9.81, 6371000, 5.972e+24, 16, "calculations", null, null, null, null)
		break;

	case(planet == "Mars"):
		var Mars = new Planet(mass, alt, "Mars", 3.711, 3390000, 6.39e+23, 20, "calculations", null, null, null, null)
		break;

	case(planet == "Jupiter"):
		var Jupiter = new Planet(mass, alt, "Jupiter", 24.79, 69911000, 1.898e+27, -234, "calculations", null, null, null, null)
		break;

	case(planet == "Saturn"):
		var Saturn = new Planet(mass, alt, "Saturn", 10.44, 58232000, 5.683e+26, -178, "calculations", null, null, null, null)
		break;

	case(planet == "Uranus"):
		var Uranus = new Planet(mass, alt, "Uranus", 8.69, 25362000, 8.681e+25, -216, "calculations", null, null, null, null)
		break;

	case(planet == "Neptune"):
		var Neptune = new Planet(mass, alt, "Neptune", 11.15, 24622000, 1.024e+26, -214, "calculations", null, null, null, null)
		break;

	default:
		var Planetx = new Planet(mass, alt, null, null, null, null, null, "calculations", nameX, gX, rX, MX, TX)
		break;					
	}				
	return false;
}; //function takeInputCalc ends



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**************************************************************************
 Function name: takeInputPers
 Purpose: Purpose of the function is to take the input and echo it back
 Parameters: NONE
 Return value: NONE
**************************************************************************/
function takeInputPers(){
	//TAB 2
	//personal information
	var first = new String($('#first').val()); //declaring first name string
	var middle = new String($('#middle').val()); //declaring middle name string
	var last = new String($('#last').val()); //declaring last name string
	var phone = new String($('#phone').val()); //declaring phone number string
	var email = new String($('#email').val()); //declaring email address string
	var username = new String($('#username').val()); //declaring username string
	var password = new String($('#password').val()); //declaring password string
	//other
	var date = new String($('#datepicker').val()); //declaring date string
	var grade = new String($('#grade').val()); //declaring grade string

	//declaring concatPersonal to concatinate all the fields' values
	var concatPersonal = "<br>Information summary" 
		+ "<br>First name: " + first
		+ "<br>Middle name: " + middle
		+ "<br>Last name: " + last
		+ "<br>Phone: " + phone
		+ "<br>Email: " + email
		+ "<br>User: " + username
		+ "<br>Password: " + password
		+ "<br>Phone call date: " + date
		+ "<br>Graded understanding: " + grade;

	var outPutPers = document.getElementById("personal"); //declaring output by element id
	//declaring satelliteConcat to concatinate all the fields' values
	outPutPers.innerHTML = concatPersonal;
	var outputValid = document.getElementById("validation"); //declaring variable to prompt validation status
	outputValid.innerHTML = "Validation confirmed! You will be contacted within next few business days.";
	return false;
}; //function takeInputPers ends


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//VALIDATION
$.validator.setDefaults({
	submitHandler: function() {
		$("#submit1").click(function() {
		    takeInputCalc();
		    $('#outputcalc').show(3000);
		    $([document.documentElement, document.body]).animate({
       		 scrollTop: $("#outputcalc").offset().top
    		}, 2000);
		});

		$("#submit2").click(function() {
		    takeInputPers();
		    $('#outputpers').show(3000);
		    $([document.documentElement, document.body]).animate({
       		 scrollTop: $("#outputpers").offset().top
    		}, 2000);
		});
		return false;
	}
});
}); //doc.ready ends