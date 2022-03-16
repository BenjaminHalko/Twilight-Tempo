/// @desc
if(gameoverNum > 0) {
	Input();
	
	if(gameoverNum > 20) {
		key_select = true;
		gameoverChoice = 1;
	}
	
	if(key_select) {
		global.score = 0;
		global.lives = 12;
		if(gameoverChoice == 0) room_restart();
		else game_restart();
	}
	
	if(key_up_pressed or key_down_pressed or key_left_pressed or key_right_pressed) {
		gameoverChoice = !gameoverChoice;
		audio_play_sound(snBlip,1,false);
	}
}

if(!instance_exists(oPlayer) and alarm[0] <= 0) alarm[0] = 30;