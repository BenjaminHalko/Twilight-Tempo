randomize();

surface_resize(application_surface,256,224);

global.joystickPressed = ds_map_create();
global.score = 0;
global.lives = 12;
global.alive = 1;
global.time = 0;
global.hardMode = false;

global.start = true;

global.hiScore = 0;

global.challengeID = ["0e1771b3-4621-4907-b8a2-b26d7d5bbd6d","938d4b27-11dd-4b0e-a120-6faf8b9e31fe"];

global.modeName = ["normal","hard"];

global.dirSounds = [snRight,snUp,snLeft,snDown];

global.index = 0;

global.stars = [];

repeat(120) array_push(global.stars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1)
});

window_set_size(1024/2,896/2);

for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.5);
lastTime = 0;

room_goto_next();