/// @desc
if(gameoverNum > 0) {
	global.score = 0;
	global.lives = 12;
	if(event_data[? "posX"] >= room_width/2) room_restart();
	else game_restart();
}