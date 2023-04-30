randomize();

#macro WIDTH display_get_gui_width()
#macro HEIGHT display_get_gui_height()

#macro GUIX (room_width-WIDTH)/2
#macro GUIY (room_height-HEIGHT)/2

#macro DISPLAYRATIO (oGlobalController.width / oGlobalController.height)

#macro NormalLeaderboard "CgkIsZiXgOcREAIQFw"
#macro HardLeaderboard "CgkIsZiXgOcREAIQGA"
#macro SecretAchievement "CgkIsZiXgOcREAIQFg"

#macro MaxResolution 168

//Background
global.starColors = [ #ffcd00,#0078f8,#8C00FF,#FE0054,#00F0F0 ];
global.stars = [];
global.frontStars = [];

//Notch & Screen Size
global.notched = NOTCH_is();
global.notchTop = 0;
global.notchBottom = 0;
global.notchLeftTop = 0;
global.notchRightTop = 0;
global.notchRightBottom = 0;

ResizeScreen(window_get_width(),window_get_height());

audio_master_gain(0.60);

//Global
global.score = 0;
global.hiScore = [0,0];
global.lives = 0;
global.time = 0;

ini_open("save.ini");
for(var i = 0; i < 2; i++) {
	global.hiScore[i] = ini_read_real("scores",i,0);	
}

//Mode
global.hardMode = false;
global.hintMode = false;

global.start = ini_read_real("Mode","Tutorial",true);
ini_close();

repeat(110) array_push(global.stars,{
	x: irandom(WIDTH)+GUIX,
    y: irandom(HEIGHT)+GUIY,
	col: irandom(2),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1)
});

for(var i = 0; i < 30; i++) array_push(global.frontStars,{
	x: irandom(WIDTH)-GUIX,
    y: irandom(HEIGHT)-GUIY,
	col: irandom(2),
	alpha: random(2),
	alphaSpeed: random_range(0.005,0.01),
});

width = window_get_width();
height = window_get_height();

// Gamepad
global.joystickPressedH = ds_map_create();
global.joystickPressedV = ds_map_create();
global.lastUsedGamepad = -1;
global.rumble = 0;
for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.05);
lastTime = 0;