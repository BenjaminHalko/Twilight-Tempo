/// @desc
if(TOUCH && gameoverNum > 0 && !mouse_check_button_pressed(mb_left)) {
	if(event_data[? "posX"] >= room_width/2) room_restart();
	else game_restart();
}