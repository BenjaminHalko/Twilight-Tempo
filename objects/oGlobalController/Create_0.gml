randomize();

surface_resize(application_surface,256,224);

audio_master_gain(0.60);

//Global
global.score = 0;
global.hiScore = [0,0];
global.lives = 0;
global.time = 0;

var _default = [2000,1000];
ini_open("save.ini");
for(var i = 0; i < 2; i++) {
	global.hiScore[i] = ini_read_real("scores",i,_default[i]);	
}
ini_close();

//Mode
global.hardMode = false;
global.hintMode = false;

global.start = false;

//Background
global.stars = [];
global.frontStars = [];

repeat(120) array_push(global.stars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1)
});

var _starAmount = 20;
for(var i = 0; i < _starAmount; i++) array_push(global.frontStars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha: random(2),
	alphaSpeed: random_range(0.005,0.01),
});