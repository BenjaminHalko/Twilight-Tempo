/// @desc
if(gameoverNum > 0) {
	if(event_data[? "posX"] >= room_width/2) room_restart();
	else game_restart();
}