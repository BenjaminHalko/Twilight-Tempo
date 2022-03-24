/// @desc

if(index < 4) layer_background_blend(layer_background_get_id(layer_get_id("Background")),backgroundColors[index]);
else oShadow.darkness = (index-3)/4;
index++;

if(index == 8 && global.start) {
	global.start = false;
	global.score = 0;
	global.lives = 12*(1+global.hintMode);
	oBeatController.mode = 0;
	oBeatController.barNumber = 0;
	ds_list_clear(oBeatController.extraBeat);
	ds_list_add(oBeatController.extraBeat,-1,-1,-1,-1);
	alarm[1] = 30;
}