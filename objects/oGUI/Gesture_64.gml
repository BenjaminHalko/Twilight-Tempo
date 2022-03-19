/// @desc
if(gameoverNum > 0 && !mouse_check_button_pressed(mb_left)) {
	global.score = 0;
	global.lives = 12;
	if(event_data[? "posX"] >= room_width/2) room_restart();
	else game_restart();
}