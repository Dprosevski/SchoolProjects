/**************************************************************************
Filename: graphics.js
Written by: Dimitrije Prosevski (DP)
Purpose: JS for graphics.html
**************************************************************************/

//global vars
var scene;
var bird;

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
		this.mouseY = e.pageY;
	}

	this.canvas.style.cursor = "none";
	this.setSize(600, 600);
	this.canvas.style.backgroundColor = "lightblue";
} //Scene ends


function Sprite(scene, imageFile, width, height, drawing){ //drawing = true = drawn image
	this.canvas = scene.canvas;
	this.context = this.canvas.getContext("2d");
	this.image = new Image();
	this.image.src = imageFile;
	this.width = width;
	this.height = height;
	this.x = 0;
	this.y = 300;
	this.dx = 10;
	this.dy = 0;
	this.drawing = drawing;

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
			//rectangle
			var ctx = this.canvas.getContext("2d");
			ctx.fillStyle = "blue";
			ctx.fillRect(0, 400, 600, 600);
			//circle
			ctx.strokeStyle = "yellow";
			ctx.fillStyle = "yellow";
			ctx.beginPath();
			ctx.arc(100,100,40,0,2*Math.PI);
			ctx.stroke();
			ctx.fill();
			//line 1
			ctx.moveTo(100, 150);
			ctx.lineTo(100, 210);
			ctx.stroke();
			//line 2 
			ctx.moveTo(130, 150);
			ctx.lineTo(170, 200);
			ctx.stroke();
			//line 3
			ctx.moveTo(160, 130);
			ctx.lineTo(190, 150);
			ctx.stroke();
		}
		img.restore();   
	} // end draw function

	this.update = function(drawing){
		this.x += this.dx;
		this.y += this.dy;
		this.draw(drawing);
	}
} //Sprite ends


function init(){
  	scene = new Scene();
  	bird = new Sprite(scene, "bird.png", 50, 50, false);
	crosshair = new Sprite(scene, "crosshair.png", 30, 30, false);
	circle = new Sprite(scene, "bird.png", null, true);
  	setInterval(newBird, 3000);
  	scene.start();

	crosshair.followMouse = function(){
		crosshair.x = document.mouseX;
		crosshair.y = document.mouseY;
	}
} //init ends

function update(drawing){
	scene.clear();
	bird.update(false);
	circle.update(true);
	crosshair.followMouse();
	crosshair.update(false);
}

function newBird(){
	bird = new Sprite(scene, "bird.png", 50, 50, false);
}