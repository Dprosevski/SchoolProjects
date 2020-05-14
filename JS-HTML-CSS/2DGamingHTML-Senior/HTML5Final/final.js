/**************************************************************************
Filename: final.js
Written by: Dimitrije Prosevski (DP)
Purpose: JS for final.html
**************************************************************************/

//jQuery
$('#submit').click(doAll);

function doAll() {
	takeInput();
	doHide();
	doShow();
}

function doHide() {
	$('.radios').hide(1000);
	$('.radios').css("color", "white")
	$('#submit').hide(1000);
	$('#clear').hide(1000);
	$('#read').hide(1000);
}

function doShow() {
	$('#blue').show(1000);
	$('#red').show(1000);
}

function gameDone() {
	$('#blue').hide(1000);
	$('#output').hide(1000);
}

//local storage
myStorage = window.localStorage;
$('#clear').click(clearStorage);
function clearStorage() {
	localStorage.clear();
	alert("Previous history cleared.")
}


//global vars
var difficulty;
var scene;
var coin = [];
var temp;
var coinName = "pirateCoin.png";
var coinNum = 5; //number of coins to be looped
var timer;
var count = -1; //number of coins collected
var add = 0; //add to chaser
var missed = 5; //number of coins missed until game over
var hundreds  = 100; //every 100 coins
var game = false;
document.getElementById("output").innerHTML = "Please select the difficulty.<br>"
	+ "Game starts in 3 seconds after pressing start button.<br>"
	+ "Collect as many coins as you can, good luck!"

//variables that vary depending on difficulty (if easy)
var growRate = 0.2 //chaser's grow rate
var startingPos = 450; //chaser's starting pos
var retract = 100; //retract chaser by 50 px
var everyNum = 5; //every 5th point retract by "retract" value above
var addLimit = -350; //limit where chaser stops growing


//sounds	
var coinS = new Audio();
var retractS = new Audio();
var gameOn = new Audio();
var gameOverS = new Audio();
var laugh = new Audio();
var miss = new Audio();
var crowd = new Audio();
coinS.src = "coin.mp3";
retractS.src = "retract.mp3";
gameOn.src = "background.mp3";
gameOverS.src = "gameOver.mp3";
laugh.src = "laugh.mp3";
miss.src = "miss.mp3";
crowd.src = "crowd.mp3";


//Scene start
function Scene(){
	this.canvas = document.createElement("canvas");
    document.body.appendChild(this.canvas);
    this.context = this.canvas.getContext("2d");

	this.clear = function(){
		this.context.clearRect(0, 0, this.width, this.height);
	}

	this.start = function(){
		this.intID = setInterval(update, 50);
		document.onmousemove = this.updateMousePos;
	}

    this.stop = function(){
      	clearInterval(this.intID);
    }

	this.setSizePos = function(height, width, top, left){
		this.setSize(height, width);
		this.setPos(top, left);
	}

	this.setSize = function(width, height){
		this.width = width;
		this.height = height;
		this.canvas.width = this.width;
		this.canvas.height = this.height;
	}

	this.updateMousePos = function(e){
		this.mouseX = e.pageX;
		this.mouseY = e.pageY-250;
	}

	this.canvas.style.cursor = "none";
	this.setSize(600, 600);
	//this.canvas.style.backgroundColor = "darkred";
} //Scene ends


//Sprite Start
function Sprite(scene, imageFile, width, height, drawing){ //drawing = true = drawn image
	this.canvas = scene.canvas;
	this.context = this.canvas.getContext("2d");
	this.image = new Image();
	this.image.src = imageFile;
	this.width = width;
	this.height = height;
	this.x = 300;
	this.y = 0;
	this.dx = 0;
	this.dy = -5;
	this.drawing = drawing;

	//draw start
	this.draw = function(){
		img = this.context;
		img.save();
		img.translate(this.x, this.y);
		if(this.drawing == false) { //if image
			img.drawImage(this.image, 0, 0, this.width, this.height);
		}
		else{ //if drawing
			this.x = 0;
			this.y = 0;
			
			for (let i = 0; i < 1200; i += 50) {
				img.drawImage(this.image, 0, (startingPos+add)+i, this.width, this.height/2);
			}

			if (add > addLimit) {
				add = add-growRate;
			}	

		}
		img.restore();   
	} //end draw

	//update start
	this.update = function(drawing){
		this.x += this.dx;
		this.y -= this.dy;
		this.draw(drawing);
	}//end update

	//collidesWith start
	this.collidesWith = function(sprite){

		mouseLeft = this.x;
		mouseRight = this.x + this.width;
		mouseTop = this.y;
		myBottom = this.y + this.height;
		spriteLeft = sprite.x;
		spriteRight = sprite.x + sprite.width;
		spriteTop = sprite.y;
		spriteBottom = sprite.y + sprite.height;
		//assume collision
		collision = true;
		
		//not coliding
		if ((myBottom < spriteTop) ||
		    (mouseTop > spriteBottom) ||
		    (mouseRight < spriteLeft) ||
		    (mouseLeft > spriteRight)) {
		     	collision = false;
		}//end if

		if (collision == true) {
			count++; //add coins colleted
				if (count % everyNum == 0 && add <= addLimit) { //retract on certain amount of coins
					retractS.play();
					add += retract;
				}

				if (count == hundreds) { //retract by 100 every 100 coins
					retractS.play();
					add += 100;
					hundreds += 100;
				}
		}

	    return collision;
  	}//end collidesWith

}//Sprite ends


//init start
function init(){
  	scene = new Scene();
	wait(3000);

  	var pos = 100;
    timer = new Timer();
    timer.reset();

  	for (var i = 0; i < coinNum; i++) { //initialize coins
	  	coin[i] = new Sprite(scene, coinName, 50, 50, false, null);
	  	coin[i].x = (pos) + Math.random()*100-50;
	  	pos = pos + 100;
  	}

	temp = Math.random()*4000+4500;
  	setInterval(newCoin, temp);

  	temp = Math.random()*4500+4500;
  	setInterval(newCoin1, temp);

  	temp = Math.random()*5000+4500;
  	setInterval(newCoin2, temp);

  	temp = Math.random()*5500+4500;
  	setInterval(newCoin3, temp);

  	temp = Math.random()*6000+4500;
  	setInterval(newCoin4, temp);

  	hand = new Sprite(scene, "hand.png", 30, 30, false);
	chaser = new Sprite(scene, "lava.gif", 600, 100, true);
 
  	scene.start();

	hand.followMouse = function(){
		hand.x = document.mouseX;
		hand.y = document.mouseY;
	}
} //init ends

//update start
function update(drawing){
  	gameOn.play();
	scene.clear();

	if (difficulty == "Medium") {
		growRate = 0.3
		startingPos = 350;
		retract = 70;
		everyNum = 7;
		addLimit = -250;
	}

	else if (difficulty == "Hard") {
		growRate = 0.4
		startingPos = 250;
		retract = 50;
		everyNum = 9;
		addLimit = -150;
	}

	for (var i = 0; i < coinNum; i++) {
		checkCollisions(coin[i]);
		coin[i].update(false);
		if (coin[i].y == -addLimit+50) { //if coin hit chaser
			if (add > addLimit) { //if add > -150 keep adding -50 for each coin missed
				add += -50;
			}
			if (add < addLimit) { //if add > -150 stop adding
				add = addLimit;
			}
			miss.play();
			missed--;
		}
	
	}
	
	currentTime = timer.getElapsedTime();

	chaser.update(true);
	hand.followMouse();
	hand.update(false);
    document.getElementById("output").innerHTML =
    	"Difficulty: " + difficulty
    	+ "<br>Chaser's limit: " + Math.abs(Math.round(add)) + " / " + Math.abs(addLimit)
    	+ "<br>Time elapsed: " + currentTime;

    document.getElementById("blue").innerHTML = "Number of coins collected: " + count;
    document.getElementById("red").innerHTML = "Number of misses left: " + missed;

   	if (missed == 0 || add < addLimit-50) { //if game over
   		gameDone();
   		var currentScore = count;

   		if (currentScore > localStorage.getItem('bestScore')) {
	   		localStorage.setItem('bestScore', currentScore);
			var getBestScore = localStorage.getItem('bestScore');
			if (localStorage.getItem('bestScore') == null) {
				localStorage.setItem('bestScore', 0);
			}
			if (count > 20)
				crowd.play();
			if (count <= 20)
	   			laugh.play();
		}

	   	else {
	   		getBestScore = localStorage.getItem('bestScore');
	   		gameOverS.play();
	   	}

	   	document.getElementById("red").innerHTML = "Game Over" + "<br>You have lasted for " + currentTime
	   		+ " seconds and colleted in total " + count + " coins."
	   		+ "<br>Best score: " + getBestScore;
	   	scene.stop();
	   	gameOn.pause();
	}
}//update end

//functions for set interval to create new sprites
function newCoin() {
	coin[0] = new Sprite(scene, coinName, 50, 50, false);
	coin[0].x = 100 + Math.random()*100-50; //random position
}

function newCoin1() {
    coin[1] = new Sprite(scene, coinName, 50, 50, false);
	coin[1].x = 200 + Math.random()*100-50;
}

function newCoin2() {
	coin[2] = new Sprite(scene, coinName, 50, 50, false);
	coin[2].x = 300 + Math.random()*100-50;
}

function newCoin3() {
	coin[3] = new Sprite(scene, coinName, 50, 50, false);
	coin[3].x = 400 + Math.random()*100-50;
}

function newCoin4() {
	coin[4] = new Sprite(scene, coinName, 50, 50, false);
	coin[4].x = 500 + Math.random()*100-50;
}

//check checkCollisions start
function checkCollisions(object){
    if (hand.collidesWith(object)){
        object.y = -200; //if colides, put sprite above Canvas
        coinS.play();
    }
} // end checkCollisions


//Timer from Simple Game engine
function Timer(){
    this.reset = function(){
        this.date = new Date();
        this.startTime = this.date.getTime();
        this.elapsedTime = 0;    
    } // end reset
    
    
    this.getCurrentTime = function(){
        this.date = new Date();
        return this.date.getTime();
    } // end getCurrentTime
    
    this.getElapsedTime = function(){
        current = this.getCurrentTime();
        return (current - this.startTime) / 1000;
    } // end getElapsedTime

    //make alias functions for animations...
    this.start = this.reset;
    this.getTimeElapsed = this.getElapsedTime;
    
    this.reset();
} // end Timer def

function wait(ms){
	var start = new Date().getTime();
	var end = start;
	while(end < start + ms) {
		end = new Date().getTime();
	}

}

//scan for difficulty
function takeInput(){
	function checkingRadios(form) {
	    var checkRadio1 = document.getElementById("radio1").checked;
	    var checkRadio2 = document.getElementById("radio2").checked;
	    var checkRadio3 = document.getElementById("radio3").checked;
	    
	    if(checkRadio1) {
		    var radio1 = new String($('#radio1').val());
		}

	    if(checkRadio2) {
		    var radio2 = new String($('#radio2').val());
		}

		if(checkRadio3) {
		    var radio3 = new String($('#radio3').val());
		}

		var radioArray = [radio1, radio2, radio3];
		var promptRadioArray = [];
		
		for(i=0; i<=radioArray.length; i++){
			if(radioArray[i] != null){
				promptRadioArray[i] = radioArray[i];
				difficulty = promptRadioArray[i];
			}
		}

		return false;  
	}//end of checkingRadios()

	checkingRadios();
	//difficulty = concatRadios;
}