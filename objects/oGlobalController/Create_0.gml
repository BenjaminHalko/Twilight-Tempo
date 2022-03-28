randomize();

surface_resize(application_surface,256,224);

audio_master_gain(0.60);

//Gamepad
global.joystickPressedH = ds_map_create();
global.joystickPressedV = ds_map_create();
global.lastUsedGamepad = noone;
global.rumble = 0;

//Global
global.score = 0;
global.hiScore = [];

if(file_exists("scores.ini")) {
	ini_open("scores.ini");
	for(var i = 0; i < 2; i++) {
		var _grid = ds_grid_create(2,10);
		ds_grid_read(_grid,ini_read_string(i,"grid",-1));
		array_push(global.hiScore,_grid);
	}
	ini_close();
} else {
	for(var j = 0; j < 2; j++) {
		array_push(global.hiScore,ds_grid_create(2,10));
		for(var i = 0; i < 10; i++) {
			ds_grid_add(global.hiScore[j],0,i,(10-i)*500);
			ds_grid_add(global.hiScore[j],1,i,"BEN");
		}
	}
	
	ini_open("scores.ini");
	ini_write_string(0,"grid",ds_grid_write(global.hiScore[0]));
	ini_write_string(1,"grid",ds_grid_write(global.hiScore[1]));
	ini_close();
}

global.lives = 0;
global.time = 0;

global.demo = false;
global.song = noone;

global.bpm = 130;

//Mode
global.hardMode = false;
global.hintMode = false;

global.start = false;

maxWait = 32;
waitTimer = maxWait;
lastWaitTime = -1;

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

window_set_size(1024,896);

room_goto_next();