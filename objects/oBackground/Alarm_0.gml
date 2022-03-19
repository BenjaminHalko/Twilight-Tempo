/// @desc
index -= 1-mode*2;
oShadow.darkness = max(0,index-4)/4;
layer_background_blend(layer_background_get_id(layer_get_id("Background")),backgroundColors[min(4,index)]);
if(index == 0) {
	oPlayer.heartAmount = 0;
	oPlayer.heartAppear = 1;
} else if(index == 8 && global.start) {
	global.start = false;
	global.score = 0;
	global.lives = 12;
	oBeatController.mode = 0;
	oBeatController.barNumber = 0;
	ds_list_clear(oBeatController.extraBeat);
	ds_list_add(oBeatController.extraBeat,-1,-1,-1,-1);
	alarm[1] = 30;
}