/// @desc
global.index -= 1-mode*2;
oShadow.darkness = max(0,global.index-4)/4;
layer_background_blend(layer_background_get_id(layer_get_id("Background")),backgroundColors[min(4,global.index)]);
if(global.index == 0) {
	oPlayer.heartAmount = 0;
	oPlayer.heartAppear = 1;
} else if(global.index == 8 && global.start) {
	global.start = false;
	global.score = 0;
	global.lives = 12;
	alarm[1] = 30;
}