randomize();

surface_resize(application_surface,256,224);

audio_master_gain(0.60);

#macro TOUCH 0

//Gamepad
global.joystickPressedH = ds_map_create();
global.joystickPressedV = ds_map_create();
global.lastUsedGamepad = noone;
global.rumble = 0;

//Global
global.score = 0;
global.hiScore = 0;
global.lives = 0;
global.time = 0;

//Mode
global.hardMode = false;
global.modeName = ["normal","hard"];
global.hintMode = false;

global.start = true;

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

for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.5);
lastTime = 0;

width = 256;
height = 224;