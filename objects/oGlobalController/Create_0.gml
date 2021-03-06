randomize();

surface_resize(application_surface,256,224);

audio_master_gain(0.60);

global.joystickPressedH = ds_map_create();
global.joystickPressedV = ds_map_create();
global.lastUsedGamepad = noone;
global.rumble = 0;

global.score = 0;
global.lives = 0;
global.time = 0;
global.hardMode = false;

if(os_type == os_operagx) global.challenge = gxc_get_query_param("challenge");
else global.challenge = undefined;

global.start = global.challenge == undefined;

global.hiScore = 0;

global.challengeID = ["0e1771b3-4621-4907-b8a2-b26d7d5bbd6d","938d4b27-11dd-4b0e-a120-6faf8b9e31fe"];

global.modeName = ["normal","hard"];

global.hintMode = false;

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

if(os_type != os_operagx) window_set_size(1024,896);

for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.5);
lastTime = 0;